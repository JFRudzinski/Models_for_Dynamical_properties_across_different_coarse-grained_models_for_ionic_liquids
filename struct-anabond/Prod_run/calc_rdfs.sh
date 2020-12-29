#!/bin/bash

#####################################################################

#System Specific
sys="CG"

blen=0.6
tol=5.0

######################################################################

#Directories
bin="/sw/linux/gromacs/5.1.2/bin/"

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
tpr="BMI-PF6.tpr"
ndx="index_dist.ndx"

######################################################################

#Calculate Distributions

types=( 'I1' 'I2' 'I3' 'CT' 'PF' )
Ntypes=4

for i in `seq 0 ${Ntypes}`;
do
    for j in `seq $i ${Ntypes}`;
    do
        echo ${types[$i]}
        echo ${types[$j]}
        echo " "
        $g_rdf -f ${trr} -s ${tpr} -n ${ndx} -bin 0.005 -o rdf_${types[$i]}-${types[$j]}.xvg <<-EOF
           $i
           $j
EOF
    done
done

