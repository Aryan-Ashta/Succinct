package org.aryanashta.succint

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import io.github.jan.supabase.auth.Auth
import io.github.jan.supabase.createSupabaseClient
import io.github.jan.supabase.postgrest.Postgrest

val supabase = createSupabaseClient(
    supabaseUrl = "https://zwqhugfnfydnxcrjbmqa.supabase.co",
    supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp3cWh1Z2ZuZnlkbnhjcmpibXFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY5NzU3NDEsImV4cCI6MjA2MjU1MTc0MX0.PxuguiXpcyxKMV3T5nY6A6ynzBF3ApM8asi7ZL7Ng4I"
) {
    install(Auth)
    install(Postgrest)
}
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            App()
        }
    }
}

@Preview
@Composable
fun AppAndroidPreview() {
    App()
}