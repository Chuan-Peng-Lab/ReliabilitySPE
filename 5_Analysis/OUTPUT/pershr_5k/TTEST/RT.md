
Independent-Samples t-test

Hypothesis: two-sided (μ2 - μ1 ≠ 0)

Descriptives:
────────────────────────────────────────
 Variable Factor    Level  N Mean (S.D.)
────────────────────────────────────────
        r Target Close    34 0.52 (0.26)
        r Target Stranger 34 0.53 (0.20)
────────────────────────────────────────

Levene’s test for homogeneity of variance:
──────────────────────────────────────────────────────────
                              Levene’s F df1 df2     p    
──────────────────────────────────────────────────────────
r: Target (Stranger - Close)        1.71   1  66  .195    
──────────────────────────────────────────────────────────
Note: H0 = equal variance (homoscedasticity).
If significant (violation of the assumption),
then you should better set `var.equal=FALSE`.

Results of t-test:
───────────────────────────────────────────────────────────────────────────────────────────────
                                 t df     p     Difference [95% CI] Cohen’s d [95% CI]     BF10
───────────────────────────────────────────────────────────────────────────────────────────────
r: Target (Stranger - Close)  0.18 66  .860      0.01 [-0.10, 0.12] 0.04 [-0.44, 0.53] 2.52e-01
───────────────────────────────────────────────────────────────────────────────────────────────

