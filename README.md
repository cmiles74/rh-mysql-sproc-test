Delimiter Issue with Roundhouse and MySQL
=========================================

This project contains a sample database that demostrates an issue with the way
Roundhouse parses MySQL scripts that contain stored procedures. If that stored
procedure ends with a trailing "DELIMITER" statement, the execution of that 
procedure will fail.

This is interesting because there's a lot of MySQL documentation that does
exactly this!

* [Sample MySQL Documentation with Trailing Delimiter](https://dev.mysql.com/doc/connector-net/en/connector-net-tutorials-stored-procedures.html)

The thinking here, I bet, is that they assume that you are typing their example
into an interactive terminal. If you're writing a standalone script that will
be executed in its own session then that trailing "DELIMITER" isn't necessary.

Demonstrating the Issue
------------------------

To demonstrate the issue, copy the "connection-settings-sample.ps1" file to
"connection-settings.ps1" and then edit that file to connect to your MySQL
server. With that set, run the "migrate.ps1" PowerShell script.

To see Roundhouse run without issue, comment out the last line of the 
"/sproc/select_best_person.sql" file.
