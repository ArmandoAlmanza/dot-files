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
function nb {npm run build}

  # Vite Function
function vit {
  param(
    $name, $template
  )
  npm init vite@latest $name -- --template $template
}

  # cd functions
function dev {
  param (
    $project
  )
  cd D:\Dev\$project
}

function esc {
  param (
    $materia, $parcial
  )
  cd D:\Escuela\$materia\$parcial
}

# Copiar configuraciones y estilos por defecto
function cvi {

  param(
    $language
  )

  if($language -eq "react"){
    copy D:\Dev\Config\$language\vite.config.js (get-location)
  }  
  if($language -eq "react-ts") {
    copy D:\Dev\Config\$language\* (get-location)
  }   
  if($language -eq "vue") {
    copy D:\Dev\Config\$language\vite.config.js (get-location)
  } 
  if($language -eq "vue-ts") {
    copy D:\Dev\Config\$language\* (get-location)
  } 
}

# function cs {
#   copy D:\Dev\Config\Styles\* (get-location) -Recurse -Force
# }
