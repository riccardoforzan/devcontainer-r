# devcontainer-r

Setup a reproducible environment for R development and a way to distribute R applications using docker

## Dev setup (using VSCode)

1. Start a new terminal inside the devcontainer and run `R`
2. If you clone a project that already has `renv.lock` as a file, you only need to run `renv::restore()`
3. If your project does not have an `renv.lock`, you should initialize the project using *Renv*

    ```R
    install.packages("renv")
    renv::init()
    ```

4. Install required libraries (e.g. glue)

    ```R
    install.packages("glue")
    renv::snapshot()  
    ```

## Distribution Setup

1. Create an image `docker build -t myapplication:0.0.1 .`
2. Run the application `docker run myapplicaiton:0.0.1`
