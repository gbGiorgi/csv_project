# Rails Application

This is a sample Rails application that utilizes PostgreSQL as the database.

## Prerequisites

- Ruby (version 3.0.0)
- Rails (version 7.0.5)
- PostgreSQL (version 15.2)

## Getting Started

1. Clone the repository:

   ```shell
   git clone git@github.com:gbGiorgi/csv_project.git

2. Install the required dependencies:

  cd csv_project
  bundle install

3. Configure the database connection:

  Open the config/database.yml file.
  Update the username and password fields with your PostgreSQL credentials.

4. Create and migrate the database:

  rails db:create
  rails db:migrate

5. Start the Rails server:

  rails server

6. To use this application you need a csv file with the following parameters id,name,age

7. Open your web browser and navigate to http://localhost:3000 to access the application.

## additional configuration

  To customize the application's settings, you can check the config/application.rb file.
  For more detailed configuration options, please refer to the official Rails documentation.

## Contributing

  Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

Feel free to modify the content according to your specific Rails application.
