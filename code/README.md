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

* `Code`, which holds the codes for all analysis/computations and containes three main directories: 
   * functions, which contains generic functions used in scripts
   * scripts, which is the main folder for all data process and model analysis
   * tests, which holds unit tests for output comparison

The complete file-structure for this folder is as follows:

```
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
```


### REFERENCES
James, Gareth, Daniela Witten, Trevor Hastie, and Robert Tibshirani. An Introduction to Statistical Learning: With Applications in R. New York: Springer, 2013. Print.



