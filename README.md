# Notebook for "A Multiverse Assessment of the Reliability of the Perceptual Matching Task as a Measurement of the Self-prioritization Effect"
Authors: Zheng Liu, Mengzhen Hu, Yuan-Rui Zheng, Jie Sui, Hu Chuan-Peng  
Corresponding email address: hcp4715@hotmail.com

## Purpose
This repository is an on-going notebook that analyzes results from a series of experiments on prioritization of good person in perceptual matching task. In total, ten experiments were included (total N = 404).

The scripts were made public to increasing the transparency and reproducibility of this study, all de-identified raw data were uploaded.

## Links:
Preprint: https://osf.io/preprints/psyarxiv/g6uap  

OSF Project: https://osf.io/6dghm/  

## Data
This repo only includes our own data`[4_1_Raw_Data]`. The public data we collected `[4_2_Open_Data]` is not included in this repo.  

```
│  .gitignore
│  README.md
│
├─1_Pre-registration Protocol
│  │  About.txt
│  │
│  ├─1_1_Pre-Registration
│  │  │  About.txt
│  │  │  Reliability_SPE_pre-reg.docx
│  │  │
│  └─1_2_Planned_Analysis
│      │  .RData
│      │  .Rhistory
│      │  1_Clean_Data.Rmd
│      │  2_Split_Half.Rmd
│      │  3_Reliability.Rmd
│      │  4_IntraClass Correlation.Rmd
│      │  5_Plot.Rmd
│      │  Pilot.Rproj
│      │
│      ├─1_2_1_DATA
│      │      simulated_data.csv
│      │      Sim_resampling.Rmd
│      │
│      └─1_2_2_OUTPUT
│              Fig4_SPE_SHR.png
│              Fig5_SPE_ICC.png
│              Fig_1_exp_pro.png
│              Fig_2_simulated_data.png
│              Fig_3_flow_chart.png
│              Flow_Chart.pptx
│              SALT.pptx
│              Supplementary_Table_1.csv
│              Supplementary_Table_2.csv
│              supp_Fig_8.png
│
├─2_Literature_Search
│  ├─2_1_Papers
│  ├─2_2_Open_Data_Paper
│
├─4_Data_Extraction
│  │  Open_Data.xlsx
│  │
│  ├─4_1_Raw_Data
│  │  │  SPMT_raw.csv
│  │  │
│  │  └─SciDataBank
│  │          CodeBook_Data_for_Exp1.xlsx
│  │          CodeBook_Data_for_Exp2.xlsx
│  │          Data_for_Exp1.csv
│  │          Data_for_Exp2.csv
│  │          Readme.md
│  │
│  └─4_2_Open_Data
│      │  README.txt
│      ├─Paper_0
│      ├─Paper_19
│      ├─Paper_34
│      ├─Paper_44
│      ├─Paper_46
│      ├─Paper_51
│      ├─Paper_54
│      ├─Paper_95
│      ├─Paper_n13
│      ├─Paper_n14
│      ├─Paper_n16
│      ├─Paper_n23
│      ├─Paper_n4
│      ├─Paper_s1
│      ├─Paper_s2
│      ├─Paper_s3
│      ├─Paper_s4
│      ├─Paper_s5
│      ├─Paper_t1
│      ├─Paper_t10
│      ├─Paper_t13
│      ├─Paper_t18
│      ├─Paper_t2
│      ├─Paper_t27
│      ├─Paper_t28
│      ├─Paper_t3
│      ├─Paper_t5
│      ├─Paper_t6
│      ├─Paper_t7
│      ├─Paper_t9
│      └─Paper_u1
│
├─5_Analysis
│  │  .RData
│  │  .Rhistory
│  │  0_Functions.Rmd
│  │  10_Supp_Plot.Rmd
│  │  1_Check_Data.Rmd
│  │  1_Clean_Data_r.Rmd
│  │  1_Clean_Data_s.Rmd
│  │  1_Clean_Data_t.Rmd
│  │  1_Clean_Data_u.Rmd
│  │  2_Split_Half.Rmd
│  │  3_Reliability.Rmd
│  │  4_IntraClass Correlation.Rmd
│  │  5_Meta.Rmd
│  │  6_Meta_Plot.Rmd
│  │  7_Load_DATA.Rmd
│  │  8_Description.Rmd
│  │  9_Main_Plot.Rmd
│  │  Formal.Rproj
│  │  Label.xlsx
│  │  Loop Split Half & Reliability.Rmd
│  │  README.md
│  │
│  ├─DATA
│  │  │
│  │  └─simulate
│  │
│  ├─DDM_Packages_Comparison
│  │      .RData
│  │      .Rhistory
│  │      DDM_Packages_Comparison.Rproj
│  │      DDM_Pack_Comp.Rmd
│  │
│  ├─FIGURE
│  │  ├─main
│  │  │      Fig4a_meta_shr.png
│  │  │      Fig4b_meta_icc.png
│  │  │      Fig4_shr_icc.png
│  │  │      Fig_1_SMT.pptx
│  │  │      Fig_2_Flow_Chart.pptx
│  │  │      Fig_3_Forest_RT.png
│  │  │
│  │  ├─meta
│  │  │  │  meta_plot.html
│  │  │  │  meta_plot.md
│  │  │  │
│  │  │  ├─png
│  │  │  │      Forest_Close_ACC.png
│  │  │  │      Forest_Close_d.png
│  │  │  │      Forest_Close_eta.png
│  │  │  │      Forest_Close_RT.png
│  │  │  │      Forest_Close_v.png
│  │  │  │      Forest_Close_z.png
│  │  │  │      Forest_Stranger_ACC.png
│  │  │  │      Forest_Stranger_d.png
│  │  │  │      Forest_Stranger_eta.png
│  │  │  │      Forest_Stranger_RT.png
│  │  │  │      Forest_Stranger_v.png
│  │  │  │      Forest_Stranger_z.png
│  │  │  │
│  │  │  └─webp
│  │  │
│  │  └─supp
│  │          Fig_S10_yi&trials.png
│  │          Fig_S11_Spear_Brown.png
│  │          Fig_S1_SMT.pptx
│  │          Fig_S2_PRISMA.pptx
│  │          Fig_S3_DDM_Pkg_Comp.png
│  │          Fig_S4_meta_bind.png
│  │          Fig_S5_meta_fs.png
│  │          Fig_S5_meta_od.png
│  │          Fig_S5_meta_per.png
│  │          Fig_S6a_ICC_P0.png
│  │          Fig_S6b_ICC_Ps2.png
│  │          Fig_S6_ICC.png
│  │          Fig_S7_Cov.png
│  │          Fig_S8_r&Trial.png
│  │          Fig_S9_yi&r.png
│  │
│  ├─OUTPUT
│  │  │  Tables.xlsx
│  │  ├─icc
│  │  ├─meta
│  │  ├─nmshr
│  │  │  └─TTEST
│  │  ├─pershr_10
│  │  └─pershr_5k
│  │      └─TTEST
│  │
│  └─PACKAGES
│          yukiBP_0.1.6.tar.gz
│          yukiSH_0.0.4.tar.gz
│
├─6_Manuscript
│  │
│  ├─1_Word_Version
│  │  │  Reliability_SMT_main_Revision_fin.docx
│  │  │  Supplementary Material_revision_fin.docx
│  │  │
│  │
│  └─2_Pdf_Version
│      │  Reliability_SMT_v3.pdf
│      │  Supplementary Material_v4.pdf
│
└─7_Reports
        Reliability_SPMT_NACP25th_V3.pptx
```

<details>
  <summary>1_Pre-registration Protocol</summary>
│  │  About.txt  <br>
│  │  <br>
│  ├─1_1_Pre-Registration<br>
│  │  │  About.txt<br>
│  │  │  Reliability_SPE_pre-reg.docx<br>
│  │  │<br>
│  └─1_2_Planned_Analysis<br>
│  │  │  .RData<br>
│  │  │  .Rhistory<br>
│  │  │  1_Clean_Data.Rmd<br>
│  │  │  2_Split_Half.Rmd<br>
│  │  │  3_Reliability.Rmd<br>
│  │  │  4_IntraClass Correlation.Rmd<br>
│  │  │  5_Plot.Rmd<br>
│  │  │  Pilot.Rproj<br>
│  │  │  <br>
│  │  │  │  1_2_1_DATA<br>
│  │  │  │  simulated_data.csv<br>
│  │  │  │  Sim_resampling.Rmd<br>
│  │  │  │  <br>
│  │  │  │  1_2_2_OUTPUT<br>
│  │  │  │  Fig4_SPE_SHR.png<br>
│  │  │  │  Fig5_SPE_ICC.png<br>
│  │  │  │  Fig_1_exp_pro.png<br>
│  │  │  │  Fig_2_simulated_data.png<br>
│  │  │  │  Fig_3_flow_chart.png<br>
│  │  │  │  Flow_Chart.pptx<br>
│  │  │  │  SALT.pptx<br>
│  │  │  │  Supplementary_Table_1.csv<br>
│  │  │  │  Supplementary_Table_2.csv<br>
│  │  │  │  supp_Fig_8.png<br>
│<br>
</details>
