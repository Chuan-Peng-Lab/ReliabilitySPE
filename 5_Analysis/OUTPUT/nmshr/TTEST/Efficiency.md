
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    68 0.47 (0.32)
        r Target Stranger 68 0.54 (0.25)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        4.03   1 134  .047 *  
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
────────────────────────────────────────────────────────────────────────────────────────────────
                                 t  df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
────────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  1.44 134  .152      0.07 [-0.03, 0.17] 0.25 [-0.09, 0.59] 4.72e-01
────────────────────────────────────────────────────────────────────────────────────────────────

