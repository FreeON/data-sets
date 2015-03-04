#!/bin/bash

for xyz in xyz/*.xyz; do
    FILENAME=$(basename ${xyz} .xyz)
    INPUT=${FILENAME}.inp
    cat <<EOF > ${INPUT}
<BeginTitle>
Water Cluster Scaling
<EndTitle>

<BeginOptions>
Charge=0
Multiplicity=1
Guess=SuperPos
SCFMethod=(SDMM,SDMM)
BasisSets=(STO-2G,6-31G**)
ModelChem=(BLYPxc,BLYPxc)
Accuracy=(Loose,Good)
DebugAll=(MaxDebug)
Geometry=(InAngstroms,HOrder)
BlokAInv=(Test,1.D20)
<EndOptions>

<BeginGeometry>
EOF
    tail -n+3 ${xyz} >> ${INPUT}
    cat <<EOF >> ${INPUT}
<EndGeometry>
EOF
done
