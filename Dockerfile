FROM islasgeci/base:0.7.0
COPY . /workdir
RUN apt update && apt install --yes \
    gnuplot
RUN pip install \
    sklearn \
    tensorflow
RUN Rscript -e "install.packages(c('covr', 'devtools', 'lintr', 'roxygen2', 'styler', 'testthat', 'vdiffr'), repos='http://cran.rstudio.com')"
