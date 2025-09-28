
# Tests if given path lies within a git working folder. If so, it displays the current branch name in the prompt.
function Test-GitRepo {
   param (
      [Parameter(Mandatory)]
      [string]$Path
   )
   
   do {
      if (Test-Path (Join-Path $Path '.git')) {
         break
      }
      $Path = Split-Path $Path
   } while ($Path -ne '')
   
   return $Path -ne ''
}

function Prompt {
   $p = Get-Location
   $b = 'not a git repo'
   if (Test-GitRepo $p) {
      $b = git branch --show-current
   }
   "$([char]27)[38;2;0;200;255m($b)$([char]27)[39;49m $p> "
}
