#!/bin/bash

#####################################################################

#System Specific
sys="CG"

blen=0.6
tol=5.0

######################################################################

#Directories
bin="/sw/linux/gromacs/4.5/full/4.5.3/bin/"

######################################################################

#Executables
g_rdf="${bin}g_rdf"
g_bond="${bin}/g_bond${suff}"
g_angle="${bin}/g_angle${suff}"
g_rmsd="${bin}/g_rmsdist${suff}"
g_rmsf="${bin}/g_rmsf${suff}"

#g_rdf="g_rdf4.5.3"
#g_bond="g_bond4.5.3"
#g_angle="g_angle4.5.3"
#g_rmsd="g_rmsdist4.5.3"
#g_rmsf="g_rmsf4.5.3"

######################################################################

#File Names
trr="BMI-PF6.trr"
tpr="BMI-PF6_new.tpr"
ndx="index_dist.ndx"

######################################################################

#Calculate Distributions

$g_rdf -f ${trr} -s ${tpr} -n ${ndx} -rdf mol_COG -bin 0.005 -o rdf_ring_COG.xvg <<-EOF
       10
       10
EOF
