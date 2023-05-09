%LPP
OldMean_LPP = 4.271481468253969;
OldStd_LPP = 4.070441;

NewMean_LPP = 3.049476;
NewStd_LPP = 4.213719;

NeuMean_LPP = 4.229873;
NeuStd_LPP = 5.084955;



y = [OldMean_LPP,NewMean_LPP; NeuMean_LPP,NewMean_LPP];


figure;
hBar = bar(y)
Labels = {'Old vs. New', 'Neutral vs. New'};
set(gca, 'XTick', 1:6, 'XTickLabel', Labels);
set(gca,'fontname','times')
box off
hold off



%N250
OldMean_N250 = -0.067654155;
%OldStd_N250 = 2.518226;

NewMean_N250 = 0.346002355;
%NewStd_N250 =

NeuMean_N250 = -0.48678308;
%NeuStd_N250 = 2.717140;

EmoMean_N250 = 0.141910308;
%EmoStd_N250 = 2.518226;



y = [OldMean_N250; NewMean_N250;NeuMean_N250; EmoMean_N250];


figure;
hBar = bar(y)
Labels = {'Old ',' New','Neutral','Emotional'};
set(gca, 'XTick', 1:6, 'XTickLabel', Labels);
set(gca,'fontname','times')
box off
hold off

%FN400

OldMean_N170 = 0.149728;
OldStd_N170 = 2.518226;

NewMean_N170 = 0.583270;
NewStd_N170 = 1.734783;

NeuMean_N170 = 0.778821;
NeuStd_N170 = 1.788935;

PosMean_FN400 = 5.31887;
PosStd_FN400 = 3.921441;

NegMean_FN400 = 6.03907;
NegStd_FN400 = 4.23301155;

EmoMean_N170 = 0.504488;
EmoStd_N170 = 1.530792;
'All Hits vs. New',
NegMean_N170,NeuMean_N170, PosMean_N170,NewMean_N170;EmoMean_N170,NeuMean_N170; 
y = [NegMean_FN400, PosMean_FN400];


figure;
hBar = bar(y)
Labels = {'Negative', 'Positive'};
set(gca, 'XTick', 1:6, 'XTickLabel', Labels);
set(gca,'fontname','times')
box off
hold off