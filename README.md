# UCLA Biostat 203B Introduction to Data Science in R

Course webpage for UCLA Biostat 203B (Intro. to Data Science in R)  
<https://ucla-biostat-203b.github.io/2024winter/>

## Reproduce the course materials

Brief instructions for reproducing the course materials are given below. For more detailed instructions, see [lab 1](https://ucla-biostat-203b.github.io/2024winter/labs/lab01/lab01.html).

To render the lecture materials (`qmd` files),  

1. Install R/RStudio, Quarto, Python, and Julia. 

2. Install the R packages required for the course. 

    ```r
    # in R terminal
    install.packages(read.csv("Docker/r_pkgs.txt", header = F)[[1]], repos = "https://cran.rstudio.com")
    ```
    
3. Install the Python packages required for the course. More often than not, you have multiple versions of Python installed on your machine. Make sure you install the packages for the Python version that you use for this course. In RStudio, choose the Python version at `Tools` -> `Global Options` -> `Python`. 

    ```bash
    # in Bash terminal
    python -m pip install -r Docker/python_pkgs.txt
    ```

4. Install the Julia packages required for the course. 

    ```julia
    # in Julia terminal
    using Pkg
    Pkg.add.(readlines("Docker/julia_pkgs.txt"));
    ```

## Docker

Alternatively, you can use Docker to reproduce the course materials.

1. Install Docker Desktop.

2. Pull the Docker image from Docker Hub.

    ```bash
    docker pull huazhou/ucla-biostat-203b-2024w
    ```

3. Modify `docker-compose.yml` to map `203-lecture`, `203-hw`, `212a-lecture`, `mimic`, `~/.ssh`, and `~/.gitconfig`  folders on local machine to container.

4. Run the Docker image.

    ```bash
    docker-compose up
    ```