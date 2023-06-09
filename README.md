# README

Step by step to run project in your __ubuntu__ system

Things you may want to cover:

* Database initialization
    * We used PostgreSQL in this app
    * You must install PostgreSQL database in your system
    * You can install PostgreSQL databse in ubuntu by following commands
    * `sudo apt update`
    * `sudo apt install postgresql postgresql-contrib libpq-dev`
    * `sudo systemctl start postgresql`
    * `sudo systemctl enable postgresql`
    * Create PostgreSQL username and database 
    * `sudo -u postgres createuser yuor_user_name`
    * `sudo -u postgres createdb your_database_name` 
    * If you want create password to your db following command
    * `sudo -u postgres psql`
    * `alter user <username> with encrypted password '<password>';`
    * `grant all privileges on database <dbname> to <username>;`
  


* Ruby "3.1.3"
    * You can install Ruby with rvm on ubuntu by this https://github.com/rvm/ubuntu_rvm or run following commands
    * `sudo apt-get install software-properties-common`
    * `sudo apt-add-repository -y ppa:rael-gc/rvm`
    * `sudo apt-get update`
    * `sudo apt-get install rvm`
    * `sudo usermod -a -G rvm $USER`
    * `echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc`
    * `source .bashrc`
    * Exit from terminal and open again
    * `rvm install 3.1.3`
    

* Rails  "7.0.4", "7.0.4.3"
    * `gem install rails`

* Nodejs
    * `sudo apt install nodejs`

* System dependencies
    * pundit
    * rspec


* Run application

    * `git clone https://github.com/Hafez-Shabrang/simple_blog_app-SBA.git`
    * `cd simple_blog_app-SBA/`
    * Go to `config/database.yml` and config it
    * ```
      development:
        <<: *default
        database: your_database_name
        username: your_user_name
        password: your_password_here
        host: localhost
        port: 5432
    ```
    * `bundle install`
    * `rails db:create`
    * `rails db:migrate`
    * `rails s`


* Run application tests with following command
    * `rspec`

