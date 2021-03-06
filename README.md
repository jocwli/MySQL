# MySQL Review:
Using MySQL to create, query, and update database tables.

### Fundamentals covered:
- Building schemas, database, tables, loading external data, stored procedures
- Modifying database and tables
- Creating databases with relational constraints
- Writing basic sql statements
- Creating store routines

### Repository contains:
1. Fundamentals mentioned above
2. Project for creating and querying a fake university database
3. Project for creating and querying a fake music industry database

### Notes to setup MySQL Command Line Client:
You can either code directly on MySQL Workbench or MySQL in Command Line. 

Using the MySQL Command Line Client in Mac runs MySQL through the terminal. You can run SQL scripts through command line or write sql scripts to text files.

1) Open Terminal
2) Find directory to call for mysql: cd /usr/local/mysql/bin
   Enter this: Use mysql;
3) Login and enter password when prompted: ./mysql -u root -p
4) Run SQL from command line terminal by using source and your file location: 
source /Users/[Your file location]/[Your data file name].SQL
5) You can also write and save scripts to TXT file: 
tee /Users/[Your file location]/[filename you want].TXT
6) Run SQL scripts
7) Stop writing to TXT file: Notee
