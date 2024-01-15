# Prompt

cls

Import-Module -Name Terminal-Icons

oh-my-posh init pwsh --config C:\Users\arman\AppData\Local\Programs\oh-my-posh\themes/arandano.omp.json | Invoke-Expression


Set-Alias winfetch pwshfetch-test-1

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{
  Command            = '#DAEAF1'
  Parameter          = '#B4E197'
  InlinePrediction   = '#C689C6'
  Default            = '#FCF69C'
  
}

# Alias
Set-Alias g git
Set-Alias ll ls
Set-Alias vim nvim
Set-Alias c code
Set-Alias v vim

Set-Alias -Name touch -Value New-Item

#Set-Alias m mongod

# Functions
function pro {code $PROFILE}
function prov {vim $PROFILE}
# function pse {php -S localhost:3000}
function ch {code (get-location)}

  # Npm functions
function nd {npm run dev}

  # cd functions
function dev {
    param (
        [string]$project
    )

    if (-not $project) {
        $project = "Dev"
    }

    $path = "D:\Dev\$project"

    if (Test-Path $path -PathType Container) {
        Set-Location $path
    } elseif (Test-Path "D:\Dev" -PathType Container) {
        Set-Location "D:\Dev"
    } else {
        Write-Host "La carpeta $project no existe en D:\Dev y no se encontró la carpeta por defecto."
    }
}

# Instalar requirements.txt

function envi {
    param (
        [string]$requirementsFile = "requirements.txt"
    )

    # Verificar si el archivo requirements.txt existe
    if (-not (Test-Path $requirementsFile -PathType Leaf)) {
        Write-Host "El archivo $requirementsFile no se encontró."
        return
    }

    # Instalar dependencias
    pip install -r $requirementsFile

    Write-Host "Dependencias instaladas correctamente."
}

# Instalar node modules y abrir vscode

function nInstall {
    $rutaProyecto = Get-Item -Path .\ -Verbose

    if (-not (Test-Path -Path "$($rutaProyecto.FullName)\node_modules")) {
        Write-Host "Instalando paquetes npm..."
        npm install
    } else {
        Write-Host "La carpeta 'node_modules' ya existe."
    }

    Write-Host "Abriendo Visual Studio Code..."
    code .
}

# function cs {
#   copy D:\Dev\Config\Styles\* (get-location) -Recurse -Force
# }
