

meanNew_electrodes =  - meanNew_electrodes;
meanOld_electrodes = - meanOld_electrodes;



meanOld_electrodes = (0 -meanOld_electrodes(1))+ meanOld_electrodes;

meanNew_electrodes = (0 -meanNew_electrodes(1))+ meanNew_electrodes;



meanNeg_electrodes = meanNeg_electrodes - mean(meanNeg_electrodes(1:26));
meanParietal_Old = meanParietal_Old - mean(meanParietal_Old(1:26));
meanNew_electrodes = meanNew_electrodes - mean(meanNew_electrodes(1:26));
meanOld_electrodes = meanOld_electrodes - mean(meanOld_electrodes(1:26));
meanPos_electrodes = meanPos_electrodes - mean(meanPos_electrodes(1:26));



meanFrontalOld = (0 -meanFrontalOld(1))+ meanFrontalOld;
meanFrontalNew = (0 - meanFrontalNew(1))+ meanFrontalNew;


meanLeftParietalOld = (0 -meanLeftParietalOld(1))+ meanLeftParietalOld;
meanLeftParietalNew = (0 - meanLeftParietalNew(1))+ meanLeftParietalNew;

meanParietalOld = (0 -meanParietalOld(1))+ meanParietalOld;
meanParietalNew = (0 - meanParietalNew(1))+ meanParietalNew;

meanNew_electrodes = (0 - meanNew_electrodes(26))+ meanNew_electrodes;
meanOld_electrodes = (0 - meanOld_electrodes(26))+ meanOld_electrodes;
meanPos_electrodes = (0 - meanPos_electrodes(26))+ meanPos_electrodes;