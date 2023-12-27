##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby 3.2.2
- Rails 7.1.2
- Docker

##### 1. Check out the repository

```bash
git clone git@github.com:liquidweavergit/influence_mobile_redux.git
```

##### 2. Create .env

Copy the env.SAMPLE - all values are valid for this sample project

```bash
cp env.SAMPLE .env
```

##### 3. Build Docker container

Run the following commands to create and setup the Docker container.
You may need to create the pids directory (included below)

```bash
docker-compose build
docker-compose up
```

##### 4. Ensure database and run migrations

The database needs to be created and migrated running the following commands
You will need to run commands on the 'website' Docker container
Run this command in a separate terminal instance
Create and Migrate are run automatically when creating the Docker instance
Seed needs to be run to have the first user and sample Offers

```bash
docker-compose exec website bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

And now you can visit the site with the URL http://localhost:3000

You can signup manually: http://localhost:3000

Or use the seeded admin user:
email: admin@admin.com
password: password

##### 5. Run Tests

To run the Rspec tests, run the following commands
You will need to run commands on the 'website' Docker container
Run this command in a separate terminal instance
(you will not have to "bash" into the container if you already have)

```bash
docker-compose exec website bash
bundle exec rspec
```