plugins {
    base
    id("com.lovelysystems.gradle") version ("0.0.7")
}

lovely {
    gitProject()
    dockerProject("lovelysystems/docker-pilbox")
    with(dockerFiles) {
        from("requirements.txt")
    }
}

val envDir = project.file("v")
val binDir = envDir.resolve("bin")
val pip = binDir.resolve("pip")
val python = binDir.resolve("python")

tasks {

    val venv by creating {
        group = "Bootstrap"
        description = "Bootstraps a python virtual environment"

        outputs.files(pip, python)
        doLast {
            exec {
                commandLine("python3", "-m", "venv", "--clear", envDir)
            }
            exec {
                commandLine(
                    pip, "install", "--upgrade",
                    "pip==18.0",
                    "pip-tools==2.0.2"
                )
            }
        }
    }

}