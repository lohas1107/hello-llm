plugins {
    java
}

repositories {
    mavenCentral()
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(25))
    }
}

dependencies {
    testImplementation("io.cucumber:cucumber-java:7.23.0")
    testImplementation("io.cucumber:cucumber-junit-platform-engine:7.23.0")
    testImplementation("org.junit.platform:junit-platform-suite:1.10.2")
    testImplementation("org.junit.jupiter:junit-jupiter:5.10.2")
}

tasks.test {
    useJUnitPlatform()
    systemProperty("cucumber.junit-platform.naming-strategy", "long")
}
