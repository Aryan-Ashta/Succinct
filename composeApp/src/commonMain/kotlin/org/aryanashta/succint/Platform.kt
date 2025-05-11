package org.aryanashta.succint

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform