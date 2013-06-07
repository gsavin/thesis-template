===============================================================================
Thesis Template
===============================================================================

Before you write
-------------------------------------------------------------------------------

If you are running a Debian based OS (Debian, Ubuntu), you can run the
following command to check for tex-live dependencies :

  ./make.sh check

Compilation
-------------------------------------------------------------------------------

Use the following command to compil your document :

   ./make.sh

You can use the `clean` command to remove all temporary files

  ./make.sh clean

Images
-------------------------------------------------------------------------------

You can put your images in `images/` and declare them in
`include/loadimages.sty`. Look at the example. Once an image is declared, you
can use the `\putimage{image_name}` command to use it.

Table
-------------------------------------------------------------------------------

You can put your table in `tables/` and declare them in
`include/localtables.sty`. Look at the example. Once a table is declared, you
can use it with the `\usetable{table_name}` command.
