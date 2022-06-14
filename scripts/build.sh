echo "SILEX - Building SILEX backend..."

# Make sure all the env files are provided
Write-Output "SILEX - Checking environment files..."
declare -a env_files=("broker" "cgwire" "harvest")
for file in "${env_files[@]}"; do 
    if test -f "./env/$file"; then
        echo "ENV FILE - Using provided: $file"
    else
        echo "ENV FILE - Copying from example: $file"
        cp "./env/$file.example" "./env/$file"
    fi
done

# Start the containers in detached mode
echo "SILEX - Starting containers..."
docker-compose --env-file ./.env up -d

# Initialize cgwire
echo "SILEX - Initialize cgwire containers..."
echo "CGWIRE - Creating zou's database"
$dbowner = "postgres"
$dbname = "zoudb"
docker-compose --env-file ./.env exec zou-db  su - postgres -c "createdb -T template0 -E UTF8 --owner $dbowner $dbname"
echo "CGWIRE - Initializing zou's database entities"
docker-compose --env-file ./.env exec zou-app sh init_zou.sh
