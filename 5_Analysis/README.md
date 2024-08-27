## README
Since the dataset we used is not all publicly available, 

 `[1_Clean_Data.rmd ~ 6_Meta_Plot.rmd]` can not run. 
 
`[7_Load_DATA.Rmd ~ 10_Supp_Plot.Rmd]`  can run normally.

If you have your own `Self-Matching Task` dataset and need to calculate split-half reliability and ICC,   
you can use `yukiSH`[https://github.com/yuki-961004/yukiSH] and `yukiBP`[https://github.com/yuki-961004/yukiBP] to preprocess your data.

- `first-second` & `odd-even` Split-Half Reliability: `./OUTPUT/nmshr/...` 
- `permuted` Split-Half Reliability: `./OUTPUT/pershr_5k/...`  
- Intraclass Correlation Coefficient: `./OUTPUT/icc/...` 

```
# ROOT
│  README.md
│  Formal.Rproj
│  Label.xlsx [all papers' info]
│
└─PACKAGES
│  │ yukiBP_0.1.6.tar.gz
│  │ yukiSH_0.0.4.tar.gz
```
```
# NOT VISIBLE
├─DATA
│  │
│  │df1, ... df45
│  │simulate
```
```
# DDM Packages Comparison

├─DDM_Packages_Comparison
│      DDM_Packages_Comparison.Rproj
│      DDM_Pack_Comp.Rmd
```
```
# LOAD PKGs and Funcs

│  0_Functions.Rmd
```
```
# CAN NOT RUN

## Clean data
│  1_Clean_Data_r.Rmd
│  1_Clean_Data_s.Rmd
│  1_Clean_Data_t.Rmd
│  1_Clean_Data_u.Rmd
│  1_Check_Data.Rmd
│
## split data and calculate reliability
│  2_Split_Half.Rmd
│  3_Reliability.Rmd
│  Loop Split Half & Reliability.Rmd
│
## calculate icc
│  4_IntraClass Correlation.Rmd
│
## meta analysis
│  5_Meta.Rmd
│  6_Meta_Plot.Rmd
```
```
# PLOT CODE

│  7_Load_DATA.Rmd
│  8_Description.Rmd
│  9_Main_Plot.Rmd
│  10_Supp_Plot.Rmd
```
```
# ALL RESULTS

├─FIGURE
│  ├─main
│  │      Fig_1_SMT.pptx
│  │      Fig_2_Flow_Chart.pptx
│  │      Fig_3_Forest_RT.png
│  │      Fig4_shr_icc.png
│  │       Fig4a_meta_shr.png
│  │       Fig4b_meta_icc.png
│  └─supp
│  │      Fig_S1_SMT.pptx
│  │      Fig_S2_PRISMA.pptx
│  │      Fig_S3_DDM_Pkg_Comp.png
│  │      Fig_S4_meta_bind.png
│  │      Fig_S5_meta_fs.png
│  │      Fig_S5_meta_od.png
│  │      Fig_S5_meta_per.png
│  │      Fig_S6_ICC.png
│  │       Fig_S6a_ICC_P0.png
│  │       Fig_S6b_ICC_Ps2.png
│  │      Fig_S7_Cov.png
│  │      Fig_S8_r&Trial.png
│  │      Fig_S9_yi&r.png
│  │      Fig_S10_yi&trials.png
│  │      Fig_S11_Spear_Brown.png
│  ├─meta
│  │  │  meta_plot.html
│  │  │  meta_plot.md
│  │  ├─png
│  │  │   Forest_Close_ACC.png
│  │  │   Forest_Close_d.png
│  │  │   Forest_Close_eta.png
│  │  │   Forest_Close_RT.png
│  │  │   Forest_Close_v.png
│  │  │   Forest_Close_z.png
│  │  │   Forest_Stranger_ACC.png
│  │  │   Forest_Stranger_d.png
│  │  │   Forest_Stranger_eta.png
│  │  │   Forest_Stranger_RT.png
│  │  │   Forest_Stranger_v.png
│  │  │   Forest_Stranger_z.png
│  │  └─webp [same as png]
├─OUTPUT
│  │  Tables.xlsx
│  ├─icc
│  ├─meta
│  ├─nmshr [first-second & odd-even split half reliability]
│  │  │TTEST
│  ├─pershr_10 [permuted split half reliability for test]
│  └─pershr_5k [permuted split half reliability]
│  │  │TTEST
```
