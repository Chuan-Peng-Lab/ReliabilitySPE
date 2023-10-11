
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    42 0.21 (0.29)
        r Target Stranger 42 0.19 (0.21)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        4.26   1  82  .042 *  
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
─────────────────────────────────────────────────────────────────────────────────────────────────
                                  t df     p     Difference [95% CI]  Cohen’s d [95% CI]     BF10
─────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  -0.28 82  .782     -0.02 [-0.13, 0.10] -0.06 [-0.49, 0.37] 2.35e-01
─────────────────────────────────────────────────────────────────────────────────────────────────

