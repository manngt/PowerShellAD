 <#
Descripcion: Script para copiar miembros de un grupo a otro
Autor: Orlando Perez
Fecha: 2021-11-25
#>
#Nombre del grupo donde estan los usuarios
$sourceGroupIdentity = 'GrupoOrigen'

#Nombre del grupo donde se copiaran los usuarios
$destinationIdentity = 'GrupoDestino'

#Copiar los miembros del grupo origen hacia el grupo destino
Get-ADGroupMember $sourceGroupIdentity | Get-ADUser | ForEach-Object {Add-ADGroupMember -Identity $destinationIdentity -Members $_}

#Verificar miembros del grupo destino
Get-ADGroupMember -identity $destinationIdentity | Select SamAccountName, name 
