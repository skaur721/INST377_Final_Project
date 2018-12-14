
*The site was created in a Windows system environment, some parts of the manual may not be applicable to readers using non-Windows operating systems

The following code for our system design was created in the text editor Atom. The solution stack AMPPS was downloaded and used to run the PHP aspect of our site. Both software is not specifically required for use but is strongly encouraged for consistency. All HTML, PHP,  & CSS files edited or created are to be saved in a site dedicated folder. This folder is to be located within the AMPPS folder that was downloaded with the software. Our file structure is as follows:

Ampps (folder) -> www (folder) -> MyPHP (Folder)
mainpage1.html
main_page.php
stylesheets.css
meekrodb.2.3.class.php
logo.png
colors.png

As this site works with a database, MySQL Workbench was used as a host for our movie data. MySQL Workbench is a useful tool for database creation and management, use of the software is also strongly encouraged. Within the database, a script storing our movie data called ‘team_4_movie_db’ will need to be executed in workbench for the data to be accessible on your server. To connect your database server to the site files, you will need to view the ‘main_page.php’ and edit the variables ‘$host’, ‘$user’, & ‘ $password’ to the specification of your own SQL server. 



