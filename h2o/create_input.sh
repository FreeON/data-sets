#!/bin/bash

for xyz in xyz/*.xyz; do
    FILENAME=$(basename ${xyz} .xyz)
    INPUT=${FILENAME}.inp
    cat <<EOF > ${INPUT}
<BeginTitle>
Water Cluster
<EndTitle>

<BeginOptions>
Charge=0
Multiplicity=1
Guess=SuperPos
SCFMethod=(TC2)
#BasisSets=(6-311G**)
BasisSets=(TZP)
ModelChem=(HF)
Accuracy=(verytight)
DebugAll=(MaxDebug)
Geometry=(InAngstroms,HOrder)
BlokAInv=(Test,1.D20)
<EndOptions>

<BeginGeometry>
EOF
    tail -n+3 ${xyz} >> ${INPUT}
    cat <<EOF >> ${INPUT}
<EndGeometry>

<BeginBasisSetTZP>
 ****
 H     0
 S   3   1.00
      34.87758369             0.0235323
       5.23397281             0.1767166
       1.18503342             0.7997511
 S   1   1.00
       0.32833943             1.0000000
 S   1   1.00
       0.11031918             1.0000000
 P   1   1.00
       0.7188440              1.0000000
 P   1   1.00
       0.3500000              1.0000000
 D   1   1.00
       1.0750600              1.0000000
 ****
 O     0
 S   5   1.00
   12870.84508387             0.0018613
    1952.24777235             0.0140129
     454.02969464             0.0696960
     130.28372806             0.2644031
      42.7927326              0.7323917
 S   2   1.00
      15.44629006             0.5962536
       5.87766148             0.4440186
 S   1   1.00
       1.53426392             1.0000000
 S   1   1.00
       0.81600697             1.0000000
 S   1   1.00
       0.2601108              1.0000000
 P   4   1.00
      63.35247031             0.0119925
      14.66997581             0.0826028
       4.46631945             0.3191903
       1.53127988             0.7081524
 P   1   1.00
       0.5440053              1.0000000
 P   1   1.00
       0.1799847              1.0000000
 D   1   1.00
       2.3901600              1.0000000
 D   1   1.00
       0.6818330              1.0000000
 F   1   1.00
       1.5109480              1.0000000
 ****
<EndBasisSetTZP>
EOF
done
