Class12
================
Victoria Shi
5/9/2019

## Set up for Docking

We will first prepare our HIV-Pr system for drug docking by making a
protein only PDB format file (i.e. we will remove water, ligand, etc.)

``` r
library(bio3d)
```

``` r
file.name <-get.pdb("1hsg")
```

    ## Warning in get.pdb("1hsg"): ./1hsg.pdb exists. Skipping download

``` r
hiv<-read.pdb("1hsg")
```

    ##   Note: Accessing on-line PDB file

``` r
hiv
```

    ## 
    ##  Call:  read.pdb(file = "1hsg")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 1686,  XYZs#: 5058  Chains#: 2  (values: A B)
    ## 
    ##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 172  (residues: 128)
    ##      Non-protein/nucleic resid values: [ HOH (127), MK1 (1) ]
    ## 
    ##    Protein sequence:
    ##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
    ##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
    ##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
    ##       VNIIGRNLLTQIGCTLNF
    ## 
    ## + attr: atom, xyz, seqres, helix, sheet,
    ##         calpha, remark, call

## Prepare initial protein and ligand input files

``` r
prot<-trim.pdb(hiv,"protein")
lig<-trim.pdb(hiv,"ligand")
```

``` r
write.pdb(prot,file="1hsg_protein.pdb")
write.pdb(lig,file="1hsg_ligand.pdb")
```

## Inspecting your docking results

``` r
library(bio3d)
res<-read.pdb("all.pdbqt", multi=TRUE)
write.pdb(res, "results.pdb")
```

## Normal Mode analysis for flexibility prediction

``` r
pdb <- read.pdb("1hel")
```

    ##   Note: Accessing on-line PDB file

``` r
modes <- nma( pdb )
```

    ##  Building Hessian...     Done in 0.018 seconds.
    ##  Diagonalizing Hessian...    Done in 0.082 seconds.

``` r
m7 <- mktrj(modes, mode=7, file="mode_7.pdb")
```
