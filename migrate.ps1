#!/usr/bin/env pwsh

# read in connection settings
. "$PSScriptRoot\connection-settings.ps1"

rh --cs $connectionString --dt $databaseType --ni --vf version.txt --repo .
