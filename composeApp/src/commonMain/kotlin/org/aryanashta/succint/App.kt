package org.aryanashta.succint

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.material.TextField
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.KeyboardType.Companion.Email
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import io.github.jan.supabase.auth.Auth
import io.github.jan.supabase.auth.OtpType
import io.github.jan.supabase.auth.auth
import io.github.jan.supabase.auth.providers.AuthProvider
import io.github.jan.supabase.auth.providers.builtin.Email
import io.github.jan.supabase.createSupabaseClient
import io.github.jan.supabase.postgrest.Postgrest
import kotlinx.coroutines.launch
import kotlinx.datetime.LocalDateTime
import kotlinx.datetime.TimeZone
import kotlinx.datetime.toLocalDateTime
import org.jetbrains.compose.resources.painterResource
import org.jetbrains.compose.ui.tooling.preview.Preview

import succint.composeapp.generated.resources.Res
import succint.composeapp.generated.resources.compose_multiplatform
import kotlinx.datetime.Clock
import kotlinx.datetime.Instant
import kotlin.time.ExperimentalTime
val supabase = createSupabaseClient(
    supabaseUrl = "https://zwqhugfnfydnxcrjbmqa.supabase.co",
    supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp3cWh1Z2ZuZnlkbnhjcmpibXFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY5NzU3NDEsImV4cCI6MjA2MjU1MTc0MX0.PxuguiXpcyxKMV3T5nY6A6ynzBF3ApM8asi7ZL7Ng4I"
) {
    install(Auth){

    }
    install(Postgrest)
}
@Composable
@Preview
fun App() {
    MaterialTheme {
        var showContent by remember { mutableStateOf(false) }

        Column(
            modifier = Modifier.fillMaxWidth().padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            var email by remember { mutableStateOf("") }
            var password by remember { mutableStateOf("") }

            Text("Welcome to Succint, signup below", fontSize = 24.sp, textAlign = TextAlign.Center)

            TextField(
                value = email,
                onValueChange = { email = it },
                label = { Text("Email") }
            )
            TextField(
                value = password,
                onValueChange = { password = it },
                label = { Text("Password") }
            )

        }
    }
}
@Composable
fun SignUpButton(onClick: () -> Unit) {
    val coroutineScope = rememberCoroutineScope()

    Button(
        onClick = {
            coroutineScope.launch {
                val email = ""
                val password = ""
                newUser(email, password)
            }
        }
    ) {
        Text("Sign Up")
    }
}
suspend fun newUser(email: String, password: String) {
    val user = supabase.auth.signUpWith(io.github.jan.supabase.auth.providers.builtin.Email) {
        this.email = email
        this.password = password

    }
}

@OptIn(ExperimentalTime::class)
fun todayDate(): String {
    fun LocalDateTime.format() = toString().substringBefore('T')

    val now: Instant = Clock.System.now()
    val zone = TimeZone.currentSystemDefault()
    return now.toLocalDateTime(zone).format()
}