# stat159-fall2016-project2

Authors: **Kevin Liao**, **Thomas Y Sun**, **Peng Cheng**
<div>
University of California, Berkeley </br>
Berkeley CA, 94072 USA </br>
Kevin Liao: lwk723@berkeley.edu </br>
</div>

### Objective 
This repository is mainly about Course Stats 159 at UC Berkeley, fall 2016 - second project. This project follows the ideas presented chapter 6: _Linear Model Selection and Regularization_ (from "An Introduction to Statistical Learning" by James et al) and performs a predictive modeling process applied on the data set `Credit`. We will carry out results and comparison between different predictive models and details the project in report paper. 

Instruction: [github project repository](https://github.com/ucb-stat159/stat159-fall-2016/tree/master/projects)

Course website: [gastonsanchez.com/stat159](http://gastonsanchez.com/stat159)

### File Structure

The file-structure for the project is as follows:

```
stat159-fall2016-project2/
   README.md
   Makefile
   LICENSE
   session-info.txt
   .gitignore
   code/
      README.md
      test-that.R
      functions/
         mse-function.R
      scripts/
         eda-qualitative-script.R
         eda-quantitative-script.R
         pre-process-script.R
         ols-regression-script.R
         ridge-regression-script.R
         lasso-regression-script.R
         PCR-script.R
         PLSR-script.R
         session-info.R
      tests/
         test-mse.R
   data/
      README.md
      Credit.csv
      eda-qualitative-output.txt
      eda-quantitative-output.txt
      correlation-matrix.RData
      scaled-credit.csv
      train-and-test-set.RData
      ols-regression-output.txt
      ols-regression.RData
      ridge-regression-output.txt
      ridge-regression.RData
      lasso-regression-output.txt
      lasso-regression.RData
      PCR-output.txt
      PCR.RData
      PLSR-output.txt
      PLSR.RData
   images/
      README.md
      barchart-Ethnicity.png
      barchart-gender.png
      barchart-married.png
      barchart-student.png
      boxplot-age.png
      boxplot-balance-ethnicity.png
      boxplot-balance-gender.png
      boxplot-balance-married.png
      boxplot-balance-student.png
      boxplot-balance.png
      boxplot-cards.png
      boxplot-education.png
      boxplot-income.png
      boxplot-limit.png
      boxplot-rating.png
      histogram-age.png
      histogram-balance.png
      histogram-cards.png
      histogram-education.png
      histogram-income.png
      histogram-limit.png
      histogram-rating.png
      ridge-cv-lambda.png
      lasso-cv-lambda.png
      pcr-cv-ncomp.png
      plsr-cv-ncomp.png
      scatterplot-matrix.png
   report/
      README.md
      report.pdf
      report.Rmd
      sections/
         00-abstract.Rmd
         01-introduction.Rmd
         02-data.Rmd
         03-methods.Rmd
         04-analysis.Rmd
         05-results.Rmd
         06-conclusions.Rmd
   slides/
      predictive-modeling-slides.Rmd
      predictive-modeling-slides.html
```

### Structure of the paper

> * 0. Abstract - provide basic information of the project
> * 1. Introduction - provide the objective of the project
> * 2. Data - explain the source and use of our raw data
> * 3. Methods - OSL, ridge, lasso, PCR, PLSR
> * 4. Analysis - train and test models for each method
> * 5. Results - display findings of the project
> * 6. Conclusions - draw conclusion from the research results
> * References

### How to r

### LICENSE

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

Author: **Kevin Liao**, **Thomas Y Sun**, **Peng Cheng**