%TesteFunctionUmDois

%% Table Negative Hits for 200-300ms
%%EEG ANOVA ANALYSIS
%%Import data from each subject and each condition
%
%
%

%% Subject 02


filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0002_Average_Neg1.txt';
delimiter = ' ';
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\.]*)+[\,]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\.]*)*[\,]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains('.')
                thousandsRegExp = '^\d+?(\.\d{3})*\,{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = strrep(numbers, '.', '');
                numbers = strrep(numbers, ',', '.');
                numbers = textscan(char(numbers), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326]);
rawStringColumns = string(raw(:, 1));
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN};
emosuj0002AverageNeg1 = table;
emosuj0002AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0002AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0002AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0002AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0002AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0002AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0002AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0002AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0002AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0002AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0002AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0002AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0002AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0002AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0002AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0002AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0002AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0002AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0002AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0002AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0002AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0002AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0002AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0002AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0002AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0002AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0002AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0002AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0002AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0002AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0002AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0002AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0002AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0002AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0002AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0002AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0002AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0002AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0002AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0002AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0002AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0002AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0002AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0002AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0002AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0002AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0002AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0002AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0002AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0002AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0002AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0002AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0002AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0002AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0002AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0002AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0002AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0002AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0002AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0002AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0002AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0002AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0002AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0002AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0002AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0002AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0002AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0002AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0002AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0002AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0002AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0002AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0002AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0002AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0002AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0002AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0002AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0002AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0002AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0002AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0002AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0002AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0002AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0002AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0002AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0002AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0002AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0002AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0002AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0002AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0002AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0002AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0002AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0002AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0002AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0002AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0002AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0002AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0002AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0002AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0002AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0002AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0002AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0002AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0002AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0002AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0002AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0002AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0002AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0002AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0002AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0002AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0002AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0002AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0002AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0002AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0002AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0002AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0002AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0002AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0002AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0002AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0002AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0002AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0002AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0002AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0002AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0002AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0002AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0002AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0002AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0002AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0002AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0002AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0002AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0002AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0002AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0002AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0002AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0002AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0002AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0002AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0002AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0002AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0002AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0002AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0002AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0002AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0002AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0002AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0002AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0002AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0002AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0002AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0002AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0002AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0002AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0002AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0002AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0002AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0002AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0002AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0002AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0002AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0002AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0002AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0002AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0002AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0002AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0002AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0002AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0002AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0002AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0002AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0002AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0002AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0002AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0002AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0002AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0002AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0002AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0002AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0002AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0002AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0002AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0002AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0002AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0002AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0002AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0002AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0002AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0002AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0002AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0002AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0002AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0002AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0002AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0002AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0002AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0002AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0002AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0002AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0002AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0002AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0002AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0002AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0002AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0002AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0002AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0002AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0002AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0002AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0002AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0002AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0002AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0002AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0002AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0002AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0002AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0002AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0002AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0002AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0002AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0002AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0002AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0002AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0002AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0002AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0002AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0002AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0002AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0002AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0002AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0002AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0002AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0002AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0002AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0002AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0002AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0002AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0002AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0002AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0002AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0002AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0002AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0002AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0002AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0002AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0002AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0002AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0002AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0002AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0002AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0002AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0002AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0002AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0002AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0002AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0002AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0002AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0002AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0002AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0002AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0002AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0002AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0002AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0002AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0002AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0002AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0002AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0002AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0002AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0002AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0002AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0002AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0002AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0002AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0002AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0002AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0002AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0002AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0002AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0002AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0002AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0002AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0002AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0002AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0002AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0002AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0002AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0002AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0002AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0002AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0002AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0002AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0002AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0002AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0002AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0002AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0002AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0002AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0002AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0002AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0002AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0002AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0002AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0002AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0002AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0002AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0002AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0002AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0002AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0002AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0002AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0002AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0002AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0002AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0002AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0002AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0002AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0002AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0002AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0002AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0002AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0002AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0002AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

%Delimeters - Space
%Variable Names row - 1

%Once data is a table in the workspace
%Export data from table to variable form
%first for each subject
T = emosuj0002AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansuj02NEG_electrodes = mean(G);
%Name variables based on each Electrode manually once for old and one for new or with a for loop if you
%can manage to figure this out

Fp1 = G(1,:);
Fz = G(2,:);
F3 = G(3,:);
F7 = G(4,:);
FT9 = G(5,:);
FC5 = G(6,:);
FC1 = G(7,:);
C3 = G(8,:);
T7 = G(9,:);
CP5 = G(10,:);
CP1 = G(11,:);
Pz = G(12,:);
P3 = G(13,:);
P7 = G(14,:);
O1 = G(15,:);
Oz = G(16,:);
O2 = G(17,:);
P4 = G(18,:);
P8 = G(19,:);
CP6 = G(20,:);
CP2 = G(21,:);
C4 = G(22,:);
T8 = G(23,:);
FT10 = G(24,:);
FC6 = G(25,:);
FC2 = G(26,:);
F4 = G(27,:);
F8 = G(28,:);
Fp2 = G(29,:);
AFz = G(30,:);
%need code 
data_selectedElectrodes_NEG = [F3; F7; FC1; C3; T7; FC5; CP1; P3; P7; P4; P8; FC6; CP2; C4; T8; FC2; F4; F8;];
%
%
G200_300 = G(:,76:100);

%data that should be copied into the table
dataSelected_NEG200_300 = data_selectedElectrodes_NEG(:,76:100);

skip = 55
first = 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG200_300,2)
    coluna = dataSelected_NEG200_300(:, col)
    start = first
    finish = first+17

    ceil = strcat('F', int2str(start))
    floor = strcat('F', int2str(finish))

    xlRange = strcat(ceil, ':', floor)
    sheet = 1
    
    xlswrite(filename, coluna, sheet, xlRange)
    first = finish + skip

end

skip = 0;
first = 0;

clear;