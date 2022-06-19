Write-Output "SILEX - Building SILEX backend..."

# Make sure all the env files are provided
Write-Output "SILEX - Checking environment files..."
foreach($file in "broker", "cgwire", "harvest") {
    if(Test-Path -Path "./env/${file}") {
        Write-Output "ENV FILE - Using provided: ${file}"
    } else {
        Write-Output "ENV FILE - Copying from example: ${file}"
        Copy-Item "./env/${file}.example" -Destination "./env/${file}"
    }
}

# Start the containers in detached mode
Write-Output "SILEX - Starting containers..."
docker-compose --env-file ./.env up -d

# Initialize cgwire
Write-Output "SILEX - Initialize cgwire containers..."
Write-Output "CGWIRE - Creating zou's database"
$dbowner = "postgres"
$dbname = "zoudb"
docker-compose --env-file ./.env exec zou-db  su - postgres -c "createdb -T template0 -E UTF8 --owner ${dbowner} ${dbname}"
Write-Output "CGWIRE - Initializing zou's database entities"
docker-compose --env-file ./.env exec zou-app sh init_zou.sh
