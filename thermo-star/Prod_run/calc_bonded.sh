#!/bin/bash

#####################################################################

#System Specific
sys="CG"

blen=0.6
tol=5.0

######################################################################

#Directories
bin="/data/isilon/rudzinski/soft_backup/gromacs-4.5.3-openmpi-dp/bin/"
suff="_mpi_d"
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
trr="BMI-PF6.pbcwhole.trr"
tpr="BMI-PF6.tpr"
ndx="index_dist.ndx"

######################################################################

#Calculate Distributions

# bonds

${g_bond} -f ${trr} -s ${tpr} -blen 0.3 -tol 0.4 -xvg none -n ${ndx} -o bond_I1-I3.xvg <<-EOF
       5
EOF

${g_bond} -f ${trr} -s ${tpr} -blen 0.3 -tol 0.4 -xvg none -n ${ndx} -o bond_I1-I2.xvg <<-EOF
       6
EOF

${g_bond} -f ${trr} -s ${tpr} -blen 0.3 -tol 0.4 -xvg none -n ${ndx} -o bond_I3-I2.xvg <<-EOF
       7
EOF

${g_bond} -f ${trr} -s ${tpr} -blen 0.3 -tol 0.8 -xvg none -n ${ndx} -o bond_I2-CT.xvg <<-EOF
       8
EOF


#angles

${g_angle} -f ${trr} -binwidth 0.5 -xvg none -n ${ndx} -od angle_I1-I2-I3.xvg <<-EOF
       9
EOF

${g_angle} -f ${trr} -binwidth 0.5 -xvg none -n ${ndx} -od angle_I1-I3-I2.xvg <<-EOF
       10
EOF

${g_angle} -f ${trr} -binwidth 0.5 -xvg none -n ${ndx} -od angle_I3-I1-I2.xvg <<-EOF
       11
EOF

${g_angle} -f ${trr} -binwidth 0.5 -xvg none -n ${ndx} -od angle_I1-I2-CT.xvg <<-EOF
       12
EOF

${g_angle} -f ${trr} -binwidth 0.5 -xvg none -n ${ndx} -od angle_I3-I2-CT.xvg <<-EOF
       13
EOF

