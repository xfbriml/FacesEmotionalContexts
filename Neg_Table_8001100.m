%% Table Negative Hits for 800-1100ms
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 03

%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0003_Average_Neg1.txt';
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
emosuj0003AverageNeg1 = table;
emosuj0003AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0003AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0003AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0003AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0003AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0003AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0003AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0003AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0003AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0003AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0003AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0003AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0003AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0003AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0003AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0003AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0003AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0003AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0003AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0003AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0003AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0003AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0003AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0003AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0003AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0003AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0003AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0003AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0003AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0003AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0003AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0003AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0003AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0003AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0003AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0003AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0003AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0003AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0003AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0003AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0003AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0003AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0003AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0003AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0003AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0003AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0003AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0003AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0003AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0003AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0003AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0003AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0003AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0003AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0003AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0003AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0003AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0003AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0003AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0003AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0003AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0003AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0003AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0003AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0003AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0003AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0003AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0003AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0003AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0003AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0003AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0003AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0003AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0003AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0003AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0003AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0003AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0003AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0003AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0003AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0003AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0003AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0003AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0003AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0003AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0003AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0003AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0003AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0003AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0003AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0003AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0003AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0003AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0003AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0003AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0003AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0003AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0003AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0003AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0003AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0003AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0003AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0003AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0003AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0003AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0003AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0003AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0003AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0003AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0003AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0003AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0003AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0003AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0003AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0003AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0003AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0003AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0003AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0003AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0003AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0003AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0003AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0003AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0003AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0003AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0003AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0003AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0003AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0003AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0003AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0003AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0003AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0003AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0003AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0003AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0003AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0003AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0003AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0003AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0003AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0003AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0003AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0003AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0003AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0003AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0003AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0003AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0003AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0003AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0003AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0003AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0003AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0003AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0003AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0003AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0003AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0003AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0003AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0003AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0003AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0003AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0003AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0003AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0003AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0003AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0003AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0003AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0003AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0003AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0003AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0003AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0003AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0003AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0003AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0003AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0003AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0003AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0003AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0003AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0003AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0003AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0003AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0003AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0003AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0003AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0003AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0003AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0003AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0003AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0003AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0003AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0003AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0003AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0003AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0003AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0003AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0003AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0003AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0003AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0003AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0003AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0003AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0003AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0003AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0003AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0003AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0003AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0003AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0003AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0003AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0003AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0003AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0003AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0003AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0003AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0003AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0003AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0003AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0003AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0003AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0003AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0003AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0003AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0003AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0003AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0003AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0003AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0003AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0003AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0003AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0003AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0003AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0003AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0003AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0003AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0003AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0003AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0003AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0003AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0003AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0003AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0003AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0003AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0003AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0003AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0003AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0003AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0003AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0003AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0003AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0003AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0003AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0003AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0003AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0003AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0003AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0003AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0003AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0003AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0003AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0003AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0003AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0003AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0003AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0003AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0003AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0003AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0003AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0003AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0003AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0003AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0003AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0003AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0003AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0003AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0003AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0003AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0003AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0003AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0003AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0003AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0003AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0003AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0003AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0003AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0003AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0003AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0003AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0003AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0003AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0003AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0003AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0003AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0003AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0003AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0003AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0003AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0003AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0003AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0003AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0003AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0003AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0003AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0003AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0003AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0003AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0003AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0003AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0003AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0003AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0003AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0003AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0003AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0003AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0003AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0003AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0003AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0003AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0003AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0003AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0003AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0003AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0003AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0003AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0003AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0003AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

%Export data from table to variable form
%first for each subject
T = emosuj0003AverageNeg1; %NCR condition first
Electrodes = T.Fp1;


G = T(:,2:326);
G = G{:,:};
meanNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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


%% Subject 04

%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0004_Average_Neg1.txt';
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

emosuj0004AverageNeg1 = table;
emosuj0004AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0004AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0004AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0004AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0004AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0004AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0004AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0004AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0004AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0004AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0004AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0004AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0004AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0004AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0004AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0004AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0004AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0004AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0004AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0004AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0004AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0004AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0004AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0004AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0004AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0004AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0004AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0004AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0004AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0004AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0004AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0004AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0004AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0004AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0004AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0004AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0004AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0004AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0004AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0004AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0004AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0004AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0004AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0004AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0004AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0004AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0004AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0004AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0004AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0004AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0004AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0004AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0004AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0004AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0004AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0004AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0004AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0004AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0004AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0004AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0004AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0004AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0004AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0004AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0004AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0004AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0004AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0004AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0004AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0004AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0004AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0004AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0004AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0004AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0004AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0004AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0004AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0004AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0004AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0004AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0004AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0004AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0004AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0004AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0004AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0004AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0004AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0004AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0004AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0004AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0004AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0004AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0004AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0004AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0004AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0004AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0004AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0004AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0004AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0004AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0004AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0004AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0004AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0004AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0004AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0004AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0004AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0004AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0004AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0004AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0004AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0004AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0004AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0004AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0004AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0004AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0004AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0004AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0004AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0004AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0004AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0004AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0004AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0004AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0004AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0004AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0004AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0004AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0004AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0004AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0004AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0004AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0004AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0004AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0004AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0004AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0004AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0004AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0004AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0004AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0004AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0004AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0004AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0004AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0004AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0004AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0004AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0004AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0004AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0004AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0004AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0004AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0004AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0004AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0004AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0004AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0004AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0004AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0004AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0004AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0004AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0004AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0004AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0004AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0004AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0004AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0004AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0004AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0004AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0004AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0004AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0004AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0004AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0004AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0004AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0004AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0004AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0004AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0004AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0004AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0004AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0004AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0004AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0004AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0004AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0004AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0004AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0004AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0004AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0004AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0004AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0004AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0004AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0004AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0004AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0004AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0004AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0004AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0004AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0004AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0004AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0004AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0004AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0004AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0004AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0004AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0004AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0004AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0004AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0004AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0004AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0004AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0004AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0004AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0004AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0004AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0004AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0004AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0004AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0004AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0004AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0004AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0004AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0004AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0004AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0004AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0004AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0004AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0004AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0004AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0004AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0004AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0004AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0004AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0004AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0004AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0004AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0004AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0004AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0004AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0004AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0004AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0004AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0004AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0004AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0004AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0004AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0004AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0004AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0004AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0004AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0004AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0004AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0004AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0004AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0004AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0004AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0004AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0004AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0004AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0004AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0004AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0004AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0004AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0004AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0004AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0004AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0004AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0004AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0004AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0004AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0004AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0004AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0004AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0004AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0004AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0004AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0004AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0004AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0004AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0004AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0004AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0004AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0004AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0004AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0004AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0004AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0004AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0004AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0004AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0004AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0004AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0004AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0004AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0004AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0004AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0004AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0004AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0004AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0004AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0004AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0004AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0004AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0004AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0004AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0004AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0004AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0004AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0004AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0004AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0004AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0004AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0004AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0004AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0004AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0004AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0004AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0004AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0004AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0004AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0004AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0004AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0004AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0004AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0004AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0004AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

%first for each subject
T = emosuj0004AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meanNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*2 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 05

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0005_Average_Neg1.txt';
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

emosuj0005AverageNeg1 = table;
emosuj0005AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0005AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0005AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0005AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0005AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0005AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0005AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0005AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0005AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0005AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0005AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0005AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0005AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0005AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0005AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0005AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0005AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0005AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0005AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0005AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0005AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0005AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0005AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0005AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0005AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0005AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0005AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0005AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0005AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0005AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0005AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0005AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0005AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0005AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0005AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0005AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0005AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0005AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0005AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0005AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0005AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0005AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0005AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0005AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0005AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0005AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0005AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0005AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0005AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0005AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0005AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0005AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0005AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0005AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0005AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0005AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0005AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0005AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0005AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0005AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0005AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0005AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0005AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0005AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0005AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0005AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0005AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0005AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0005AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0005AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0005AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0005AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0005AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0005AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0005AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0005AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0005AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0005AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0005AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0005AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0005AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0005AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0005AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0005AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0005AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0005AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0005AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0005AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0005AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0005AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0005AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0005AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0005AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0005AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0005AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0005AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0005AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0005AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0005AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0005AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0005AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0005AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0005AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0005AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0005AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0005AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0005AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0005AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0005AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0005AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0005AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0005AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0005AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0005AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0005AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0005AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0005AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0005AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0005AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0005AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0005AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0005AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0005AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0005AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0005AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0005AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0005AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0005AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0005AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0005AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0005AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0005AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0005AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0005AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0005AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0005AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0005AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0005AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0005AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0005AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0005AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0005AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0005AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0005AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0005AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0005AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0005AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0005AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0005AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0005AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0005AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0005AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0005AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0005AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0005AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0005AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0005AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0005AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0005AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0005AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0005AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0005AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0005AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0005AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0005AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0005AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0005AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0005AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0005AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0005AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0005AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0005AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0005AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0005AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0005AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0005AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0005AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0005AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0005AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0005AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0005AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0005AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0005AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0005AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0005AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0005AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0005AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0005AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0005AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0005AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0005AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0005AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0005AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0005AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0005AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0005AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0005AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0005AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0005AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0005AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0005AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0005AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0005AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0005AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0005AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0005AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0005AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0005AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0005AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0005AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0005AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0005AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0005AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0005AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0005AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0005AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0005AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0005AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0005AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0005AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0005AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0005AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0005AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0005AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0005AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0005AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0005AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0005AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0005AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0005AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0005AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0005AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0005AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0005AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0005AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0005AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0005AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0005AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0005AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0005AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0005AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0005AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0005AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0005AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0005AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0005AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0005AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0005AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0005AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0005AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0005AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0005AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0005AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0005AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0005AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0005AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0005AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0005AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0005AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0005AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0005AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0005AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0005AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0005AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0005AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0005AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0005AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0005AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0005AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0005AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0005AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0005AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0005AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0005AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0005AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0005AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0005AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0005AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0005AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0005AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0005AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0005AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0005AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0005AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0005AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0005AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0005AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0005AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0005AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0005AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0005AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0005AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0005AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0005AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0005AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0005AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0005AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0005AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0005AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0005AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0005AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0005AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0005AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0005AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0005AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0005AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0005AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0005AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0005AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0005AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0005AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0005AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0005AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0005AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0005AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0005AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0005AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0005AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0005AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0005AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0005AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0005AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0005AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0005AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0005AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0005AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

%Export data from table to variable form
%first for each subject
T = emosuj0005AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*3 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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


%% Subject 06
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0006_Average_Neg1.txt';
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
emosuj0006AverageNeg1 = table;
emosuj0006AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0006AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0006AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0006AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0006AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0006AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0006AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0006AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0006AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0006AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0006AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0006AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0006AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0006AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0006AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0006AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0006AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0006AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0006AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0006AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0006AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0006AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0006AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0006AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0006AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0006AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0006AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0006AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0006AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0006AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0006AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0006AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0006AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0006AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0006AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0006AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0006AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0006AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0006AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0006AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0006AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0006AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0006AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0006AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0006AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0006AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0006AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0006AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0006AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0006AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0006AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0006AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0006AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0006AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0006AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0006AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0006AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0006AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0006AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0006AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0006AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0006AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0006AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0006AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0006AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0006AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0006AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0006AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0006AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0006AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0006AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0006AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0006AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0006AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0006AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0006AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0006AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0006AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0006AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0006AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0006AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0006AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0006AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0006AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0006AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0006AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0006AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0006AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0006AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0006AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0006AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0006AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0006AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0006AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0006AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0006AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0006AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0006AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0006AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0006AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0006AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0006AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0006AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0006AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0006AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0006AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0006AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0006AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0006AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0006AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0006AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0006AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0006AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0006AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0006AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0006AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0006AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0006AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0006AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0006AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0006AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0006AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0006AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0006AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0006AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0006AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0006AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0006AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0006AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0006AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0006AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0006AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0006AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0006AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0006AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0006AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0006AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0006AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0006AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0006AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0006AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0006AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0006AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0006AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0006AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0006AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0006AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0006AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0006AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0006AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0006AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0006AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0006AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0006AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0006AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0006AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0006AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0006AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0006AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0006AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0006AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0006AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0006AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0006AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0006AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0006AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0006AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0006AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0006AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0006AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0006AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0006AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0006AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0006AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0006AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0006AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0006AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0006AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0006AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0006AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0006AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0006AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0006AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0006AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0006AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0006AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0006AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0006AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0006AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0006AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0006AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0006AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0006AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0006AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0006AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0006AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0006AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0006AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0006AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0006AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0006AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0006AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0006AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0006AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0006AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0006AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0006AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0006AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0006AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0006AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0006AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0006AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0006AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0006AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0006AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0006AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0006AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0006AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0006AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0006AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0006AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0006AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0006AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0006AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0006AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0006AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0006AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0006AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0006AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0006AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0006AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0006AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0006AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0006AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0006AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0006AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0006AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0006AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0006AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0006AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0006AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0006AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0006AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0006AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0006AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0006AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0006AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0006AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0006AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0006AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0006AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0006AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0006AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0006AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0006AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0006AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0006AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0006AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0006AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0006AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0006AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0006AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0006AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0006AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0006AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0006AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0006AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0006AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0006AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0006AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0006AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0006AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0006AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0006AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0006AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0006AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0006AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0006AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0006AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0006AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0006AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0006AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0006AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0006AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0006AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0006AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0006AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0006AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0006AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0006AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0006AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0006AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0006AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0006AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0006AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0006AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0006AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0006AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0006AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0006AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0006AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0006AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0006AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0006AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0006AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0006AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0006AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0006AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0006AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0006AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0006AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0006AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0006AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0006AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0006AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0006AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0006AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0006AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0006AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0006AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0006AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0006AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0006AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0006AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0006AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0006AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));

clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

%Export data from table to variable form
%first for each subject
T = emosuj0006AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*4 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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


%% Subject 07
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0007_Average_Neg1.txt';
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

emosuj0007AverageNeg1 = table;
emosuj0007AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0007AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0007AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0007AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0007AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0007AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0007AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0007AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0007AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0007AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0007AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0007AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0007AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0007AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0007AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0007AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0007AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0007AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0007AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0007AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0007AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0007AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0007AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0007AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0007AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0007AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0007AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0007AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0007AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0007AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0007AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0007AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0007AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0007AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0007AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0007AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0007AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0007AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0007AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0007AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0007AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0007AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0007AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0007AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0007AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0007AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0007AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0007AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0007AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0007AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0007AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0007AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0007AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0007AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0007AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0007AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0007AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0007AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0007AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0007AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0007AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0007AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0007AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0007AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0007AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0007AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0007AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0007AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0007AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0007AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0007AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0007AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0007AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0007AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0007AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0007AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0007AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0007AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0007AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0007AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0007AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0007AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0007AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0007AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0007AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0007AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0007AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0007AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0007AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0007AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0007AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0007AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0007AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0007AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0007AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0007AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0007AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0007AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0007AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0007AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0007AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0007AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0007AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0007AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0007AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0007AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0007AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0007AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0007AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0007AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0007AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0007AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0007AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0007AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0007AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0007AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0007AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0007AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0007AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0007AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0007AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0007AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0007AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0007AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0007AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0007AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0007AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0007AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0007AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0007AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0007AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0007AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0007AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0007AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0007AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0007AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0007AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0007AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0007AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0007AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0007AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0007AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0007AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0007AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0007AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0007AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0007AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0007AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0007AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0007AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0007AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0007AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0007AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0007AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0007AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0007AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0007AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0007AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0007AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0007AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0007AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0007AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0007AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0007AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0007AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0007AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0007AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0007AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0007AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0007AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0007AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0007AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0007AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0007AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0007AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0007AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0007AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0007AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0007AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0007AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0007AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0007AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0007AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0007AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0007AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0007AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0007AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0007AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0007AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0007AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0007AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0007AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0007AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0007AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0007AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0007AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0007AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0007AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0007AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0007AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0007AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0007AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0007AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0007AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0007AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0007AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0007AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0007AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0007AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0007AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0007AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0007AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0007AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0007AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0007AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0007AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0007AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0007AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0007AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0007AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0007AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0007AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0007AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0007AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0007AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0007AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0007AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0007AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0007AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0007AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0007AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0007AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0007AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0007AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0007AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0007AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0007AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0007AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0007AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0007AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0007AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0007AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0007AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0007AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0007AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0007AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0007AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0007AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0007AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0007AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0007AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0007AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0007AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0007AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0007AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0007AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0007AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0007AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0007AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0007AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0007AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0007AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0007AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0007AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0007AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0007AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0007AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0007AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0007AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0007AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0007AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0007AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0007AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0007AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0007AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0007AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0007AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0007AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0007AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0007AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0007AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0007AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0007AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0007AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0007AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0007AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0007AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0007AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0007AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0007AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0007AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0007AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0007AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0007AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0007AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0007AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0007AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0007AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0007AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0007AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0007AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0007AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0007AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0007AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0007AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0007AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0007AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0007AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0007AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0007AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0007AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0007AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0007AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0007AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0007AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0007AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0007AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0007AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0007AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0007AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0007AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0007AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0007AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0007AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0007AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0007AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

%Export data from table to variable form
%first for each subject
T = emosuj0007AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*5 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 08

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0008_Average_Neg1.txt';
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

emosuj0008AverageNeg1 = table;
emosuj0008AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0008AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0008AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0008AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0008AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0008AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0008AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0008AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0008AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0008AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0008AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0008AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0008AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0008AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0008AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0008AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0008AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0008AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0008AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0008AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0008AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0008AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0008AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0008AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0008AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0008AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0008AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0008AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0008AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0008AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0008AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0008AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0008AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0008AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0008AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0008AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0008AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0008AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0008AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0008AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0008AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0008AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0008AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0008AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0008AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0008AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0008AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0008AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0008AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0008AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0008AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0008AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0008AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0008AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0008AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0008AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0008AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0008AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0008AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0008AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0008AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0008AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0008AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0008AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0008AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0008AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0008AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0008AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0008AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0008AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0008AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0008AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0008AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0008AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0008AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0008AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0008AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0008AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0008AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0008AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0008AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0008AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0008AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0008AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0008AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0008AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0008AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0008AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0008AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0008AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0008AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0008AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0008AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0008AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0008AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0008AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0008AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0008AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0008AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0008AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0008AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0008AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0008AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0008AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0008AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0008AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0008AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0008AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0008AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0008AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0008AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0008AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0008AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0008AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0008AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0008AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0008AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0008AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0008AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0008AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0008AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0008AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0008AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0008AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0008AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0008AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0008AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0008AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0008AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0008AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0008AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0008AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0008AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0008AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0008AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0008AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0008AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0008AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0008AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0008AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0008AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0008AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0008AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0008AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0008AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0008AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0008AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0008AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0008AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0008AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0008AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0008AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0008AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0008AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0008AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0008AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0008AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0008AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0008AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0008AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0008AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0008AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0008AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0008AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0008AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0008AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0008AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0008AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0008AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0008AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0008AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0008AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0008AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0008AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0008AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0008AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0008AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0008AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0008AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0008AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0008AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0008AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0008AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0008AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0008AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0008AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0008AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0008AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0008AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0008AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0008AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0008AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0008AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0008AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0008AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0008AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0008AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0008AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0008AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0008AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0008AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0008AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0008AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0008AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0008AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0008AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0008AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0008AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0008AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0008AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0008AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0008AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0008AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0008AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0008AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0008AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0008AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0008AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0008AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0008AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0008AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0008AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0008AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0008AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0008AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0008AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0008AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0008AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0008AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0008AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0008AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0008AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0008AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0008AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0008AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0008AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0008AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0008AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0008AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0008AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0008AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0008AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0008AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0008AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0008AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0008AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0008AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0008AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0008AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0008AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0008AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0008AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0008AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0008AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0008AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0008AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0008AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0008AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0008AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0008AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0008AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0008AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0008AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0008AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0008AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0008AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0008AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0008AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0008AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0008AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0008AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0008AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0008AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0008AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0008AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0008AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0008AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0008AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0008AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0008AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0008AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0008AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0008AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0008AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0008AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0008AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0008AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0008AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0008AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0008AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0008AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0008AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0008AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0008AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0008AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0008AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0008AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0008AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0008AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0008AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0008AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0008AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0008AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0008AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0008AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0008AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0008AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0008AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0008AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0008AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0008AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0008AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0008AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0008AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0008AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0008AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0008AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0008AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0008AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0008AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0008AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0008AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0008AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0008AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0008AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0008AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0008AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*6 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 09

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0009_Average_Neg1.txt';
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

emosuj0009AverageNeg1 = table;
emosuj0009AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0009AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0009AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0009AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0009AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0009AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0009AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0009AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0009AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0009AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0009AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0009AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0009AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0009AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0009AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0009AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0009AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0009AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0009AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0009AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0009AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0009AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0009AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0009AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0009AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0009AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0009AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0009AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0009AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0009AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0009AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0009AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0009AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0009AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0009AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0009AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0009AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0009AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0009AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0009AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0009AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0009AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0009AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0009AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0009AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0009AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0009AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0009AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0009AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0009AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0009AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0009AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0009AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0009AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0009AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0009AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0009AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0009AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0009AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0009AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0009AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0009AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0009AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0009AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0009AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0009AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0009AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0009AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0009AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0009AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0009AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0009AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0009AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0009AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0009AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0009AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0009AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0009AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0009AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0009AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0009AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0009AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0009AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0009AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0009AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0009AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0009AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0009AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0009AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0009AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0009AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0009AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0009AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0009AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0009AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0009AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0009AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0009AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0009AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0009AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0009AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0009AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0009AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0009AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0009AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0009AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0009AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0009AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0009AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0009AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0009AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0009AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0009AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0009AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0009AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0009AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0009AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0009AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0009AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0009AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0009AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0009AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0009AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0009AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0009AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0009AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0009AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0009AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0009AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0009AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0009AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0009AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0009AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0009AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0009AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0009AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0009AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0009AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0009AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0009AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0009AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0009AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0009AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0009AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0009AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0009AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0009AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0009AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0009AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0009AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0009AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0009AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0009AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0009AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0009AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0009AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0009AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0009AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0009AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0009AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0009AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0009AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0009AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0009AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0009AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0009AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0009AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0009AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0009AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0009AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0009AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0009AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0009AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0009AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0009AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0009AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0009AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0009AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0009AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0009AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0009AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0009AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0009AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0009AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0009AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0009AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0009AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0009AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0009AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0009AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0009AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0009AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0009AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0009AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0009AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0009AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0009AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0009AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0009AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0009AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0009AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0009AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0009AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0009AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0009AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0009AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0009AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0009AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0009AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0009AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0009AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0009AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0009AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0009AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0009AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0009AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0009AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0009AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0009AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0009AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0009AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0009AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0009AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0009AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0009AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0009AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0009AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0009AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0009AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0009AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0009AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0009AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0009AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0009AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0009AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0009AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0009AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0009AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0009AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0009AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0009AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0009AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0009AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0009AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0009AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0009AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0009AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0009AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0009AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0009AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0009AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0009AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0009AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0009AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0009AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0009AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0009AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0009AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0009AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0009AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0009AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0009AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0009AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0009AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0009AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0009AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0009AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0009AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0009AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0009AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0009AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0009AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0009AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0009AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0009AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0009AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0009AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0009AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0009AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0009AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0009AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0009AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0009AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0009AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0009AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0009AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0009AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0009AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0009AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0009AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0009AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0009AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0009AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0009AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0009AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0009AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0009AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0009AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0009AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0009AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0009AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0009AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0009AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0009AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0009AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0009AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0009AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0009AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0009AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0009AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0009AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0009AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0009AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0009AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0009AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0009AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0009AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0009AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0009AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0009AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0009AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0009AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0009AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0009AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0009AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0009AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0009AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*7 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 10

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0010_Average_Neg1.txt';
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

emosuj0010AverageNeg1 = table;
emosuj0010AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0010AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0010AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0010AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0010AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0010AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0010AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0010AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0010AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0010AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0010AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0010AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0010AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0010AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0010AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0010AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0010AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0010AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0010AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0010AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0010AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0010AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0010AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0010AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0010AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0010AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0010AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0010AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0010AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0010AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0010AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0010AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0010AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0010AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0010AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0010AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0010AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0010AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0010AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0010AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0010AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0010AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0010AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0010AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0010AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0010AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0010AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0010AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0010AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0010AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0010AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0010AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0010AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0010AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0010AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0010AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0010AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0010AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0010AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0010AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0010AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0010AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0010AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0010AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0010AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0010AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0010AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0010AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0010AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0010AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0010AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0010AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0010AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0010AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0010AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0010AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0010AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0010AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0010AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0010AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0010AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0010AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0010AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0010AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0010AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0010AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0010AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0010AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0010AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0010AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0010AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0010AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0010AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0010AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0010AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0010AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0010AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0010AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0010AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0010AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0010AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0010AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0010AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0010AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0010AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0010AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0010AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0010AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0010AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0010AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0010AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0010AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0010AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0010AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0010AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0010AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0010AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0010AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0010AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0010AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0010AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0010AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0010AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0010AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0010AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0010AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0010AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0010AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0010AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0010AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0010AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0010AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0010AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0010AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0010AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0010AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0010AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0010AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0010AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0010AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0010AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0010AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0010AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0010AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0010AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0010AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0010AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0010AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0010AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0010AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0010AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0010AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0010AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0010AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0010AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0010AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0010AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0010AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0010AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0010AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0010AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0010AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0010AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0010AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0010AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0010AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0010AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0010AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0010AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0010AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0010AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0010AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0010AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0010AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0010AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0010AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0010AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0010AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0010AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0010AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0010AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0010AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0010AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0010AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0010AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0010AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0010AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0010AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0010AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0010AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0010AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0010AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0010AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0010AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0010AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0010AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0010AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0010AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0010AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0010AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0010AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0010AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0010AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0010AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0010AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0010AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0010AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0010AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0010AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0010AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0010AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0010AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0010AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0010AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0010AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0010AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0010AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0010AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0010AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0010AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0010AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0010AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0010AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0010AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0010AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0010AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0010AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0010AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0010AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0010AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0010AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0010AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0010AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0010AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0010AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0010AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0010AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0010AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0010AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0010AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0010AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0010AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0010AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0010AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0010AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0010AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0010AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0010AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0010AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0010AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0010AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0010AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0010AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0010AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0010AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0010AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0010AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0010AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0010AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0010AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0010AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0010AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0010AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0010AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0010AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0010AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0010AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0010AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0010AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0010AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0010AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0010AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0010AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0010AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0010AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0010AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0010AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0010AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0010AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0010AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0010AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0010AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0010AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0010AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0010AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0010AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0010AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0010AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0010AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0010AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0010AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0010AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0010AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0010AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0010AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0010AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0010AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0010AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0010AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0010AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0010AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0010AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0010AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0010AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0010AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0010AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0010AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0010AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0010AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0010AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0010AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0010AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0010AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0010AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0010AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0010AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0010AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0010AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0010AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0010AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0010AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0010AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0010AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0010AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0010AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0010AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0010AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*8 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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
%% Subject 11

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0011_Average_Neg1.txt';
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

emosuj0011AverageNeg1 = table;
emosuj0011AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0011AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0011AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0011AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0011AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0011AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0011AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0011AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0011AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0011AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0011AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0011AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0011AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0011AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0011AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0011AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0011AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0011AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0011AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0011AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0011AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0011AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0011AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0011AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0011AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0011AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0011AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0011AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0011AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0011AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0011AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0011AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0011AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0011AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0011AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0011AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0011AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0011AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0011AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0011AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0011AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0011AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0011AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0011AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0011AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0011AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0011AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0011AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0011AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0011AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0011AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0011AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0011AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0011AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0011AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0011AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0011AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0011AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0011AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0011AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0011AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0011AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0011AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0011AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0011AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0011AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0011AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0011AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0011AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0011AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0011AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0011AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0011AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0011AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0011AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0011AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0011AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0011AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0011AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0011AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0011AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0011AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0011AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0011AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0011AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0011AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0011AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0011AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0011AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0011AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0011AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0011AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0011AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0011AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0011AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0011AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0011AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0011AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0011AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0011AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0011AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0011AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0011AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0011AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0011AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0011AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0011AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0011AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0011AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0011AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0011AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0011AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0011AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0011AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0011AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0011AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0011AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0011AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0011AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0011AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0011AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0011AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0011AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0011AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0011AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0011AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0011AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0011AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0011AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0011AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0011AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0011AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0011AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0011AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0011AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0011AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0011AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0011AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0011AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0011AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0011AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0011AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0011AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0011AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0011AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0011AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0011AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0011AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0011AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0011AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0011AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0011AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0011AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0011AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0011AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0011AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0011AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0011AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0011AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0011AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0011AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0011AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0011AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0011AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0011AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0011AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0011AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0011AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0011AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0011AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0011AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0011AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0011AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0011AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0011AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0011AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0011AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0011AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0011AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0011AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0011AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0011AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0011AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0011AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0011AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0011AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0011AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0011AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0011AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0011AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0011AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0011AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0011AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0011AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0011AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0011AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0011AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0011AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0011AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0011AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0011AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0011AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0011AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0011AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0011AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0011AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0011AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0011AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0011AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0011AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0011AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0011AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0011AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0011AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0011AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0011AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0011AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0011AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0011AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0011AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0011AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0011AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0011AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0011AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0011AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0011AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0011AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0011AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0011AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0011AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0011AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0011AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0011AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0011AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0011AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0011AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0011AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0011AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0011AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0011AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0011AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0011AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0011AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0011AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0011AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0011AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0011AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0011AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0011AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0011AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0011AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0011AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0011AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0011AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0011AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0011AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0011AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0011AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0011AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0011AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0011AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0011AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0011AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0011AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0011AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0011AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0011AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0011AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0011AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0011AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0011AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0011AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0011AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0011AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0011AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0011AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0011AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0011AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0011AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0011AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0011AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0011AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0011AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0011AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0011AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0011AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0011AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0011AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0011AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0011AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0011AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0011AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0011AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0011AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0011AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0011AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0011AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0011AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0011AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0011AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0011AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0011AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0011AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0011AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0011AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0011AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0011AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0011AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0011AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0011AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0011AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0011AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0011AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0011AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0011AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0011AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0011AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0011AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0011AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0011AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0011AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0011AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0011AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0011AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0011AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0011AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0011AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*9 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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
%% Subject 12

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0012_Average_Neg1.txt';
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

emosuj0012AverageNeg1 = table;
emosuj0012AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0012AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0012AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0012AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0012AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0012AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0012AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0012AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0012AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0012AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0012AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0012AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0012AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0012AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0012AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0012AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0012AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0012AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0012AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0012AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0012AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0012AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0012AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0012AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0012AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0012AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0012AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0012AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0012AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0012AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0012AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0012AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0012AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0012AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0012AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0012AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0012AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0012AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0012AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0012AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0012AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0012AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0012AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0012AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0012AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0012AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0012AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0012AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0012AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0012AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0012AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0012AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0012AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0012AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0012AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0012AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0012AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0012AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0012AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0012AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0012AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0012AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0012AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0012AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0012AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0012AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0012AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0012AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0012AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0012AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0012AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0012AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0012AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0012AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0012AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0012AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0012AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0012AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0012AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0012AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0012AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0012AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0012AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0012AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0012AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0012AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0012AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0012AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0012AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0012AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0012AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0012AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0012AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0012AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0012AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0012AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0012AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0012AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0012AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0012AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0012AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0012AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0012AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0012AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0012AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0012AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0012AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0012AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0012AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0012AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0012AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0012AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0012AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0012AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0012AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0012AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0012AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0012AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0012AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0012AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0012AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0012AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0012AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0012AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0012AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0012AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0012AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0012AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0012AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0012AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0012AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0012AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0012AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0012AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0012AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0012AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0012AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0012AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0012AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0012AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0012AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0012AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0012AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0012AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0012AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0012AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0012AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0012AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0012AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0012AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0012AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0012AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0012AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0012AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0012AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0012AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0012AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0012AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0012AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0012AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0012AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0012AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0012AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0012AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0012AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0012AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0012AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0012AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0012AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0012AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0012AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0012AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0012AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0012AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0012AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0012AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0012AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0012AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0012AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0012AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0012AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0012AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0012AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0012AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0012AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0012AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0012AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0012AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0012AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0012AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0012AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0012AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0012AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0012AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0012AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0012AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0012AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0012AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0012AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0012AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0012AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0012AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0012AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0012AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0012AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0012AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0012AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0012AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0012AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0012AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0012AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0012AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0012AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0012AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0012AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0012AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0012AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0012AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0012AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0012AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0012AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0012AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0012AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0012AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0012AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0012AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0012AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0012AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0012AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0012AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0012AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0012AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0012AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0012AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0012AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0012AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0012AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0012AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0012AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0012AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0012AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0012AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0012AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0012AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0012AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0012AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0012AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0012AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0012AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0012AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0012AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0012AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0012AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0012AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0012AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0012AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0012AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0012AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0012AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0012AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0012AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0012AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0012AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0012AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0012AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0012AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0012AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0012AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0012AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0012AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0012AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0012AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0012AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0012AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0012AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0012AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0012AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0012AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0012AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0012AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0012AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0012AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0012AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0012AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0012AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0012AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0012AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0012AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0012AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0012AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0012AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0012AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0012AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0012AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0012AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0012AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0012AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0012AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0012AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0012AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0012AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0012AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0012AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0012AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0012AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0012AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0012AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0012AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0012AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0012AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0012AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0012AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0012AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0012AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0012AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0012AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0012AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0012AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0012AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0012AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0012AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0012AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0012AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0012AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0012AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0012AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0012AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*10 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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
%% Subject 13

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0013_Average_Neg1.txt';
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

emosuj0013AverageNeg1 = table;
emosuj0013AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0013AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0013AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0013AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0013AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0013AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0013AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0013AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0013AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0013AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0013AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0013AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0013AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0013AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0013AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0013AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0013AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0013AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0013AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0013AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0013AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0013AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0013AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0013AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0013AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0013AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0013AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0013AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0013AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0013AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0013AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0013AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0013AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0013AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0013AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0013AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0013AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0013AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0013AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0013AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0013AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0013AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0013AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0013AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0013AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0013AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0013AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0013AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0013AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0013AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0013AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0013AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0013AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0013AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0013AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0013AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0013AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0013AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0013AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0013AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0013AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0013AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0013AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0013AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0013AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0013AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0013AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0013AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0013AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0013AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0013AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0013AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0013AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0013AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0013AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0013AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0013AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0013AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0013AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0013AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0013AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0013AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0013AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0013AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0013AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0013AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0013AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0013AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0013AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0013AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0013AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0013AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0013AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0013AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0013AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0013AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0013AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0013AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0013AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0013AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0013AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0013AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0013AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0013AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0013AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0013AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0013AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0013AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0013AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0013AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0013AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0013AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0013AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0013AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0013AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0013AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0013AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0013AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0013AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0013AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0013AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0013AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0013AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0013AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0013AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0013AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0013AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0013AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0013AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0013AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0013AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0013AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0013AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0013AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0013AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0013AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0013AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0013AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0013AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0013AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0013AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0013AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0013AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0013AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0013AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0013AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0013AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0013AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0013AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0013AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0013AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0013AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0013AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0013AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0013AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0013AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0013AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0013AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0013AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0013AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0013AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0013AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0013AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0013AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0013AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0013AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0013AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0013AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0013AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0013AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0013AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0013AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0013AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0013AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0013AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0013AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0013AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0013AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0013AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0013AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0013AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0013AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0013AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0013AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0013AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0013AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0013AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0013AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0013AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0013AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0013AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0013AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0013AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0013AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0013AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0013AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0013AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0013AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0013AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0013AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0013AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0013AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0013AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0013AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0013AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0013AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0013AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0013AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0013AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0013AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0013AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0013AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0013AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0013AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0013AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0013AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0013AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0013AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0013AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0013AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0013AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0013AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0013AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0013AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0013AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0013AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0013AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0013AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0013AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0013AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0013AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0013AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0013AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0013AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0013AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0013AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0013AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0013AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0013AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0013AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0013AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0013AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0013AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0013AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0013AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0013AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0013AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0013AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0013AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0013AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0013AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0013AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0013AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0013AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0013AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0013AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0013AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0013AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0013AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0013AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0013AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0013AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0013AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0013AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0013AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0013AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0013AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0013AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0013AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0013AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0013AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0013AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0013AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0013AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0013AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0013AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0013AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0013AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0013AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0013AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0013AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0013AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0013AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0013AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0013AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0013AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0013AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0013AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0013AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0013AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0013AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0013AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0013AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0013AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0013AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0013AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0013AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0013AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0013AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0013AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0013AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0013AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0013AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0013AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0013AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0013AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0013AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0013AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0013AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0013AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0013AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0013AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0013AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0013AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0013AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0013AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0013AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0013AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0013AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0013AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0013AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0013AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0013AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0013AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0013AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0013AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0013AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*11 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 14

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0014_Average_Neg1.txt';
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

emosuj0014AverageNeg1 = table;
emosuj0014AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0014AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0014AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0014AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0014AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0014AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0014AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0014AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0014AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0014AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0014AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0014AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0014AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0014AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0014AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0014AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0014AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0014AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0014AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0014AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0014AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0014AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0014AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0014AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0014AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0014AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0014AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0014AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0014AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0014AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0014AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0014AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0014AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0014AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0014AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0014AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0014AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0014AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0014AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0014AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0014AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0014AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0014AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0014AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0014AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0014AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0014AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0014AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0014AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0014AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0014AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0014AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0014AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0014AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0014AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0014AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0014AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0014AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0014AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0014AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0014AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0014AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0014AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0014AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0014AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0014AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0014AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0014AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0014AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0014AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0014AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0014AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0014AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0014AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0014AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0014AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0014AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0014AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0014AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0014AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0014AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0014AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0014AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0014AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0014AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0014AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0014AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0014AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0014AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0014AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0014AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0014AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0014AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0014AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0014AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0014AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0014AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0014AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0014AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0014AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0014AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0014AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0014AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0014AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0014AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0014AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0014AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0014AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0014AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0014AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0014AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0014AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0014AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0014AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0014AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0014AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0014AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0014AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0014AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0014AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0014AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0014AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0014AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0014AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0014AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0014AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0014AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0014AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0014AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0014AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0014AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0014AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0014AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0014AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0014AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0014AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0014AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0014AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0014AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0014AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0014AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0014AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0014AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0014AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0014AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0014AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0014AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0014AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0014AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0014AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0014AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0014AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0014AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0014AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0014AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0014AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0014AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0014AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0014AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0014AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0014AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0014AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0014AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0014AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0014AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0014AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0014AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0014AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0014AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0014AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0014AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0014AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0014AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0014AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0014AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0014AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0014AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0014AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0014AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0014AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0014AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0014AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0014AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0014AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0014AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0014AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0014AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0014AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0014AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0014AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0014AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0014AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0014AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0014AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0014AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0014AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0014AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0014AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0014AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0014AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0014AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0014AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0014AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0014AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0014AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0014AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0014AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0014AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0014AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0014AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0014AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0014AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0014AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0014AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0014AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0014AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0014AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0014AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0014AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0014AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0014AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0014AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0014AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0014AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0014AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0014AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0014AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0014AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0014AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0014AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0014AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0014AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0014AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0014AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0014AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0014AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0014AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0014AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0014AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0014AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0014AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0014AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0014AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0014AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0014AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0014AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0014AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0014AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0014AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0014AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0014AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0014AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0014AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0014AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0014AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0014AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0014AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0014AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0014AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0014AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0014AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0014AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0014AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0014AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0014AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0014AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0014AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0014AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0014AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0014AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0014AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0014AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0014AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0014AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0014AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0014AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0014AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0014AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0014AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0014AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0014AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0014AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0014AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0014AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0014AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0014AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0014AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0014AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0014AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0014AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0014AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0014AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0014AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0014AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0014AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0014AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0014AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0014AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0014AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0014AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0014AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0014AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0014AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0014AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0014AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0014AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0014AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0014AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0014AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0014AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0014AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0014AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0014AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0014AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0014AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0014AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0014AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0014AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0014AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0014AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0014AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0014AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0014AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0014AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0014AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0014AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0014AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*12 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 15

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0015_Average_Neg1.txt';
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

emosuj0015AverageNeg1 = table;
emosuj0015AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0015AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0015AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0015AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0015AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0015AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0015AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0015AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0015AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0015AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0015AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0015AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0015AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0015AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0015AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0015AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0015AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0015AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0015AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0015AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0015AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0015AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0015AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0015AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0015AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0015AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0015AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0015AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0015AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0015AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0015AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0015AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0015AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0015AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0015AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0015AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0015AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0015AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0015AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0015AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0015AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0015AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0015AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0015AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0015AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0015AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0015AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0015AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0015AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0015AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0015AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0015AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0015AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0015AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0015AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0015AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0015AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0015AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0015AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0015AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0015AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0015AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0015AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0015AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0015AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0015AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0015AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0015AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0015AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0015AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0015AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0015AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0015AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0015AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0015AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0015AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0015AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0015AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0015AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0015AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0015AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0015AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0015AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0015AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0015AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0015AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0015AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0015AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0015AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0015AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0015AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0015AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0015AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0015AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0015AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0015AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0015AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0015AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0015AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0015AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0015AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0015AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0015AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0015AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0015AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0015AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0015AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0015AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0015AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0015AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0015AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0015AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0015AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0015AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0015AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0015AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0015AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0015AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0015AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0015AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0015AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0015AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0015AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0015AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0015AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0015AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0015AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0015AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0015AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0015AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0015AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0015AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0015AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0015AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0015AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0015AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0015AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0015AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0015AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0015AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0015AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0015AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0015AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0015AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0015AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0015AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0015AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0015AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0015AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0015AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0015AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0015AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0015AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0015AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0015AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0015AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0015AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0015AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0015AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0015AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0015AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0015AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0015AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0015AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0015AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0015AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0015AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0015AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0015AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0015AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0015AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0015AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0015AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0015AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0015AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0015AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0015AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0015AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0015AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0015AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0015AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0015AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0015AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0015AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0015AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0015AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0015AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0015AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0015AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0015AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0015AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0015AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0015AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0015AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0015AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0015AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0015AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0015AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0015AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0015AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0015AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0015AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0015AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0015AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0015AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0015AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0015AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0015AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0015AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0015AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0015AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0015AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0015AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0015AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0015AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0015AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0015AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0015AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0015AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0015AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0015AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0015AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0015AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0015AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0015AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0015AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0015AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0015AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0015AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0015AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0015AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0015AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0015AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0015AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0015AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0015AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0015AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0015AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0015AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0015AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0015AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0015AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0015AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0015AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0015AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0015AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0015AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0015AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0015AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0015AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0015AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0015AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0015AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0015AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0015AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0015AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0015AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0015AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0015AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0015AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0015AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0015AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0015AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0015AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0015AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0015AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0015AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0015AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0015AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0015AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0015AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0015AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0015AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0015AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0015AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0015AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0015AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0015AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0015AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0015AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0015AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0015AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0015AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0015AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0015AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0015AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0015AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0015AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0015AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0015AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0015AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0015AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0015AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0015AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0015AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0015AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0015AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0015AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0015AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0015AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0015AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0015AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0015AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0015AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0015AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0015AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0015AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0015AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0015AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0015AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0015AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0015AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0015AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0015AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0015AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0015AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0015AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0015AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0015AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0015AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0015AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0015AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0015AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0015AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0015AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0015AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0015AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*13 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 16

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0016_Average_Neg1.txt';
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

emosuj0016AverageNeg1 = table;
emosuj0016AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0016AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0016AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0016AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0016AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0016AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0016AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0016AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0016AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0016AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0016AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0016AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0016AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0016AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0016AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0016AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0016AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0016AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0016AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0016AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0016AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0016AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0016AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0016AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0016AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0016AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0016AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0016AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0016AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0016AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0016AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0016AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0016AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0016AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0016AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0016AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0016AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0016AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0016AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0016AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0016AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0016AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0016AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0016AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0016AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0016AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0016AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0016AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0016AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0016AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0016AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0016AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0016AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0016AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0016AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0016AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0016AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0016AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0016AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0016AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0016AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0016AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0016AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0016AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0016AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0016AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0016AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0016AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0016AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0016AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0016AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0016AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0016AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0016AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0016AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0016AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0016AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0016AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0016AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0016AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0016AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0016AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0016AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0016AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0016AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0016AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0016AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0016AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0016AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0016AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0016AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0016AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0016AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0016AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0016AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0016AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0016AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0016AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0016AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0016AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0016AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0016AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0016AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0016AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0016AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0016AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0016AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0016AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0016AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0016AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0016AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0016AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0016AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0016AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0016AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0016AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0016AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0016AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0016AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0016AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0016AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0016AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0016AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0016AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0016AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0016AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0016AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0016AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0016AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0016AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0016AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0016AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0016AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0016AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0016AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0016AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0016AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0016AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0016AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0016AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0016AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0016AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0016AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0016AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0016AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0016AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0016AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0016AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0016AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0016AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0016AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0016AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0016AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0016AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0016AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0016AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0016AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0016AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0016AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0016AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0016AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0016AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0016AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0016AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0016AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0016AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0016AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0016AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0016AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0016AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0016AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0016AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0016AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0016AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0016AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0016AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0016AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0016AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0016AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0016AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0016AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0016AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0016AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0016AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0016AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0016AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0016AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0016AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0016AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0016AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0016AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0016AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0016AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0016AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0016AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0016AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0016AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0016AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0016AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0016AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0016AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0016AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0016AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0016AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0016AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0016AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0016AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0016AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0016AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0016AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0016AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0016AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0016AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0016AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0016AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0016AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0016AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0016AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0016AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0016AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0016AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0016AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0016AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0016AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0016AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0016AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0016AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0016AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0016AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0016AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0016AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0016AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0016AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0016AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0016AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0016AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0016AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0016AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0016AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0016AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0016AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0016AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0016AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0016AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0016AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0016AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0016AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0016AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0016AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0016AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0016AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0016AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0016AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0016AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0016AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0016AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0016AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0016AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0016AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0016AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0016AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0016AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0016AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0016AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0016AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0016AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0016AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0016AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0016AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0016AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0016AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0016AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0016AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0016AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0016AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0016AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0016AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0016AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0016AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0016AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0016AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0016AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0016AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0016AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0016AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0016AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0016AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0016AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0016AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0016AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0016AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0016AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0016AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0016AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0016AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0016AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0016AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0016AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0016AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0016AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0016AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0016AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0016AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0016AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0016AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0016AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0016AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0016AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0016AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0016AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0016AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0016AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0016AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0016AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0016AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0016AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0016AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0016AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0016AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0016AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0016AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0016AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0016AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0016AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0016AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0016AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0016AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*14 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 17

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0017_Average_Neg1.txt';
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

emosuj0017AverageNeg1 = table;
emosuj0017AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0017AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0017AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0017AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0017AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0017AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0017AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0017AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0017AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0017AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0017AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0017AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0017AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0017AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0017AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0017AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0017AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0017AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0017AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0017AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0017AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0017AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0017AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0017AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0017AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0017AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0017AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0017AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0017AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0017AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0017AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0017AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0017AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0017AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0017AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0017AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0017AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0017AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0017AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0017AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0017AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0017AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0017AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0017AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0017AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0017AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0017AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0017AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0017AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0017AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0017AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0017AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0017AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0017AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0017AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0017AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0017AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0017AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0017AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0017AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0017AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0017AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0017AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0017AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0017AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0017AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0017AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0017AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0017AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0017AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0017AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0017AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0017AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0017AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0017AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0017AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0017AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0017AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0017AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0017AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0017AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0017AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0017AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0017AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0017AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0017AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0017AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0017AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0017AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0017AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0017AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0017AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0017AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0017AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0017AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0017AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0017AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0017AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0017AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0017AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0017AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0017AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0017AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0017AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0017AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0017AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0017AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0017AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0017AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0017AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0017AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0017AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0017AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0017AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0017AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0017AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0017AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0017AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0017AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0017AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0017AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0017AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0017AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0017AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0017AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0017AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0017AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0017AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0017AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0017AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0017AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0017AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0017AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0017AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0017AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0017AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0017AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0017AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0017AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0017AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0017AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0017AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0017AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0017AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0017AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0017AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0017AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0017AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0017AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0017AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0017AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0017AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0017AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0017AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0017AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0017AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0017AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0017AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0017AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0017AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0017AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0017AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0017AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0017AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0017AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0017AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0017AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0017AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0017AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0017AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0017AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0017AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0017AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0017AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0017AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0017AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0017AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0017AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0017AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0017AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0017AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0017AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0017AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0017AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0017AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0017AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0017AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0017AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0017AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0017AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0017AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0017AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0017AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0017AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0017AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0017AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0017AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0017AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0017AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0017AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0017AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0017AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0017AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0017AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0017AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0017AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0017AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0017AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0017AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0017AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0017AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0017AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0017AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0017AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0017AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0017AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0017AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0017AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0017AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0017AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0017AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0017AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0017AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0017AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0017AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0017AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0017AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0017AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0017AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0017AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0017AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0017AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0017AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0017AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0017AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0017AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0017AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0017AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0017AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0017AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0017AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0017AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0017AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0017AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0017AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0017AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0017AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0017AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0017AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0017AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0017AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0017AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0017AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0017AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0017AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0017AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0017AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0017AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0017AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0017AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0017AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0017AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0017AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0017AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0017AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0017AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0017AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0017AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0017AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0017AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0017AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0017AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0017AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0017AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0017AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0017AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0017AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0017AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0017AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0017AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0017AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0017AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0017AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0017AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0017AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0017AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0017AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0017AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0017AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0017AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0017AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0017AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0017AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0017AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0017AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0017AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0017AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0017AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0017AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0017AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0017AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0017AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0017AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0017AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0017AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0017AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0017AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0017AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0017AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0017AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0017AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0017AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0017AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0017AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0017AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0017AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0017AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0017AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0017AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0017AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0017AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0017AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0017AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0017AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0017AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0017AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0017AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*15 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 18

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0018_Average_Neg1.txt';
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

emosuj0018AverageNeg1 = table;
emosuj0018AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0018AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0018AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0018AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0018AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0018AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0018AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0018AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0018AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0018AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0018AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0018AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0018AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0018AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0018AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0018AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0018AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0018AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0018AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0018AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0018AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0018AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0018AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0018AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0018AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0018AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0018AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0018AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0018AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0018AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0018AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0018AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0018AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0018AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0018AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0018AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0018AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0018AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0018AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0018AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0018AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0018AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0018AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0018AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0018AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0018AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0018AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0018AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0018AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0018AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0018AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0018AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0018AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0018AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0018AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0018AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0018AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0018AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0018AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0018AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0018AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0018AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0018AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0018AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0018AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0018AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0018AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0018AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0018AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0018AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0018AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0018AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0018AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0018AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0018AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0018AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0018AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0018AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0018AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0018AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0018AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0018AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0018AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0018AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0018AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0018AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0018AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0018AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0018AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0018AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0018AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0018AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0018AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0018AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0018AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0018AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0018AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0018AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0018AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0018AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0018AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0018AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0018AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0018AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0018AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0018AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0018AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0018AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0018AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0018AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0018AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0018AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0018AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0018AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0018AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0018AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0018AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0018AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0018AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0018AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0018AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0018AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0018AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0018AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0018AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0018AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0018AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0018AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0018AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0018AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0018AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0018AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0018AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0018AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0018AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0018AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0018AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0018AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0018AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0018AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0018AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0018AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0018AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0018AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0018AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0018AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0018AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0018AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0018AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0018AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0018AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0018AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0018AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0018AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0018AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0018AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0018AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0018AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0018AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0018AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0018AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0018AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0018AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0018AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0018AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0018AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0018AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0018AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0018AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0018AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0018AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0018AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0018AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0018AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0018AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0018AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0018AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0018AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0018AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0018AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0018AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0018AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0018AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0018AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0018AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0018AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0018AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0018AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0018AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0018AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0018AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0018AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0018AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0018AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0018AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0018AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0018AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0018AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0018AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0018AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0018AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0018AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0018AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0018AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0018AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0018AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0018AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0018AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0018AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0018AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0018AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0018AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0018AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0018AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0018AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0018AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0018AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0018AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0018AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0018AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0018AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0018AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0018AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0018AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0018AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0018AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0018AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0018AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0018AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0018AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0018AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0018AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0018AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0018AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0018AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0018AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0018AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0018AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0018AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0018AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0018AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0018AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0018AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0018AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0018AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0018AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0018AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0018AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0018AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0018AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0018AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0018AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0018AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0018AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0018AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0018AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0018AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0018AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0018AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0018AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0018AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0018AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0018AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0018AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0018AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0018AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0018AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0018AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0018AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0018AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0018AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0018AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0018AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0018AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0018AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0018AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0018AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0018AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0018AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0018AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0018AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0018AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0018AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0018AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0018AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0018AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0018AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0018AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0018AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0018AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0018AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0018AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0018AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0018AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0018AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0018AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0018AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0018AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0018AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0018AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0018AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0018AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0018AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0018AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0018AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0018AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0018AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0018AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0018AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0018AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0018AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0018AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0018AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0018AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0018AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0018AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0018AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0018AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0018AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0018AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0018AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0018AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0018AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0018AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0018AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0018AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0018AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*16 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 19

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0019_Average_Neg1.txt';
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

emosuj0019AverageNeg1 = table;
emosuj0019AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0019AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0019AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0019AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0019AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0019AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0019AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0019AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0019AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0019AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0019AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0019AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0019AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0019AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0019AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0019AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0019AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0019AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0019AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0019AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0019AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0019AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0019AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0019AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0019AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0019AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0019AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0019AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0019AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0019AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0019AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0019AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0019AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0019AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0019AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0019AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0019AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0019AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0019AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0019AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0019AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0019AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0019AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0019AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0019AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0019AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0019AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0019AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0019AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0019AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0019AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0019AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0019AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0019AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0019AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0019AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0019AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0019AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0019AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0019AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0019AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0019AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0019AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0019AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0019AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0019AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0019AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0019AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0019AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0019AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0019AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0019AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0019AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0019AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0019AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0019AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0019AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0019AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0019AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0019AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0019AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0019AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0019AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0019AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0019AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0019AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0019AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0019AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0019AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0019AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0019AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0019AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0019AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0019AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0019AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0019AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0019AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0019AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0019AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0019AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0019AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0019AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0019AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0019AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0019AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0019AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0019AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0019AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0019AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0019AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0019AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0019AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0019AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0019AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0019AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0019AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0019AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0019AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0019AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0019AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0019AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0019AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0019AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0019AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0019AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0019AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0019AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0019AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0019AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0019AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0019AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0019AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0019AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0019AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0019AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0019AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0019AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0019AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0019AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0019AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0019AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0019AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0019AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0019AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0019AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0019AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0019AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0019AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0019AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0019AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0019AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0019AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0019AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0019AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0019AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0019AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0019AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0019AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0019AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0019AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0019AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0019AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0019AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0019AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0019AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0019AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0019AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0019AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0019AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0019AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0019AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0019AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0019AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0019AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0019AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0019AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0019AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0019AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0019AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0019AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0019AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0019AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0019AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0019AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0019AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0019AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0019AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0019AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0019AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0019AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0019AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0019AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0019AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0019AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0019AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0019AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0019AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0019AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0019AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0019AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0019AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0019AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0019AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0019AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0019AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0019AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0019AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0019AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0019AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0019AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0019AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0019AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0019AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0019AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0019AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0019AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0019AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0019AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0019AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0019AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0019AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0019AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0019AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0019AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0019AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0019AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0019AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0019AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0019AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0019AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0019AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0019AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0019AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0019AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0019AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0019AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0019AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0019AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0019AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0019AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0019AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0019AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0019AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0019AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0019AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0019AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0019AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0019AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0019AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0019AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0019AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0019AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0019AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0019AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0019AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0019AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0019AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0019AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0019AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0019AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0019AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0019AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0019AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0019AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0019AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0019AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0019AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0019AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0019AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0019AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0019AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0019AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0019AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0019AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0019AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0019AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0019AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0019AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0019AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0019AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0019AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0019AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0019AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0019AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0019AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0019AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0019AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0019AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0019AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0019AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0019AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0019AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0019AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0019AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0019AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0019AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0019AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0019AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0019AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0019AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0019AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0019AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0019AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0019AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0019AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0019AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0019AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0019AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0019AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0019AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0019AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0019AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0019AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0019AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0019AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0019AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0019AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0019AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0019AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0019AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0019AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0019AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0019AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0019AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0019AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0019AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0019AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*17 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 20

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0020_Average_Neg1.txt';
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

emosuj0020AverageNeg1 = table;
emosuj0020AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0020AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0020AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0020AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0020AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0020AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0020AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0020AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0020AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0020AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0020AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0020AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0020AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0020AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0020AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0020AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0020AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0020AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0020AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0020AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0020AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0020AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0020AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0020AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0020AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0020AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0020AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0020AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0020AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0020AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0020AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0020AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0020AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0020AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0020AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0020AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0020AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0020AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0020AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0020AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0020AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0020AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0020AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0020AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0020AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0020AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0020AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0020AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0020AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0020AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0020AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0020AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0020AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0020AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0020AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0020AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0020AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0020AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0020AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0020AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0020AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0020AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0020AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0020AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0020AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0020AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0020AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0020AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0020AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0020AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0020AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0020AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0020AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0020AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0020AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0020AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0020AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0020AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0020AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0020AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0020AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0020AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0020AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0020AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0020AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0020AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0020AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0020AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0020AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0020AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0020AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0020AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0020AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0020AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0020AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0020AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0020AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0020AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0020AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0020AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0020AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0020AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0020AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0020AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0020AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0020AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0020AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0020AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0020AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0020AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0020AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0020AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0020AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0020AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0020AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0020AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0020AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0020AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0020AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0020AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0020AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0020AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0020AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0020AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0020AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0020AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0020AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0020AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0020AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0020AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0020AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0020AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0020AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0020AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0020AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0020AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0020AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0020AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0020AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0020AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0020AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0020AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0020AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0020AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0020AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0020AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0020AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0020AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0020AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0020AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0020AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0020AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0020AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0020AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0020AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0020AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0020AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0020AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0020AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0020AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0020AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0020AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0020AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0020AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0020AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0020AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0020AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0020AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0020AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0020AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0020AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0020AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0020AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0020AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0020AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0020AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0020AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0020AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0020AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0020AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0020AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0020AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0020AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0020AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0020AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0020AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0020AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0020AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0020AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0020AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0020AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0020AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0020AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0020AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0020AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0020AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0020AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0020AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0020AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0020AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0020AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0020AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0020AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0020AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0020AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0020AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0020AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0020AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0020AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0020AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0020AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0020AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0020AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0020AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0020AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0020AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0020AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0020AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0020AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0020AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0020AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0020AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0020AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0020AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0020AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0020AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0020AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0020AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0020AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0020AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0020AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0020AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0020AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0020AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0020AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0020AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0020AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0020AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0020AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0020AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0020AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0020AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0020AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0020AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0020AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0020AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0020AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0020AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0020AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0020AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0020AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0020AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0020AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0020AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0020AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0020AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0020AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0020AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0020AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0020AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0020AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0020AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0020AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0020AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0020AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0020AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0020AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0020AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0020AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0020AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0020AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0020AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0020AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0020AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0020AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0020AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0020AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0020AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0020AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0020AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0020AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0020AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0020AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0020AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0020AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0020AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0020AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0020AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0020AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0020AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0020AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0020AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0020AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0020AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0020AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0020AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0020AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0020AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0020AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0020AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0020AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0020AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0020AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0020AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0020AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0020AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0020AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0020AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0020AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0020AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0020AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0020AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0020AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0020AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0020AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0020AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0020AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0020AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0020AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0020AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0020AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0020AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0020AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0020AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0020AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0020AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0020AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*18 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 21

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0021_Average_Neg1.txt';
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

emosuj0021AverageNeg1 = table;
emosuj0021AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0021AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0021AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0021AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0021AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0021AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0021AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0021AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0021AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0021AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0021AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0021AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0021AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0021AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0021AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0021AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0021AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0021AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0021AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0021AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0021AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0021AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0021AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0021AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0021AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0021AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0021AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0021AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0021AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0021AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0021AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0021AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0021AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0021AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0021AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0021AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0021AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0021AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0021AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0021AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0021AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0021AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0021AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0021AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0021AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0021AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0021AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0021AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0021AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0021AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0021AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0021AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0021AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0021AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0021AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0021AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0021AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0021AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0021AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0021AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0021AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0021AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0021AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0021AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0021AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0021AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0021AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0021AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0021AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0021AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0021AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0021AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0021AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0021AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0021AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0021AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0021AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0021AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0021AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0021AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0021AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0021AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0021AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0021AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0021AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0021AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0021AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0021AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0021AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0021AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0021AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0021AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0021AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0021AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0021AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0021AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0021AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0021AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0021AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0021AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0021AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0021AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0021AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0021AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0021AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0021AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0021AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0021AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0021AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0021AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0021AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0021AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0021AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0021AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0021AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0021AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0021AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0021AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0021AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0021AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0021AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0021AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0021AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0021AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0021AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0021AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0021AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0021AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0021AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0021AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0021AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0021AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0021AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0021AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0021AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0021AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0021AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0021AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0021AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0021AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0021AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0021AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0021AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0021AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0021AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0021AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0021AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0021AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0021AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0021AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0021AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0021AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0021AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0021AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0021AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0021AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0021AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0021AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0021AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0021AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0021AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0021AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0021AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0021AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0021AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0021AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0021AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0021AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0021AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0021AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0021AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0021AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0021AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0021AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0021AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0021AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0021AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0021AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0021AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0021AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0021AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0021AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0021AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0021AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0021AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0021AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0021AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0021AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0021AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0021AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0021AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0021AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0021AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0021AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0021AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0021AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0021AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0021AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0021AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0021AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0021AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0021AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0021AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0021AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0021AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0021AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0021AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0021AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0021AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0021AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0021AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0021AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0021AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0021AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0021AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0021AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0021AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0021AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0021AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0021AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0021AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0021AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0021AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0021AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0021AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0021AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0021AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0021AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0021AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0021AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0021AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0021AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0021AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0021AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0021AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0021AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0021AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0021AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0021AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0021AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0021AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0021AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0021AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0021AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0021AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0021AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0021AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0021AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0021AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0021AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0021AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0021AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0021AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0021AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0021AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0021AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0021AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0021AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0021AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0021AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0021AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0021AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0021AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0021AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0021AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0021AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0021AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0021AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0021AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0021AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0021AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0021AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0021AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0021AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0021AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0021AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0021AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0021AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0021AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0021AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0021AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0021AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0021AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0021AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0021AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0021AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0021AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0021AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0021AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0021AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0021AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0021AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0021AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0021AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0021AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0021AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0021AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0021AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0021AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0021AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0021AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0021AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0021AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0021AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0021AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0021AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0021AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0021AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0021AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0021AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0021AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0021AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0021AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0021AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0021AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0021AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0021AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0021AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0021AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0021AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0021AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0021AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0021AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0021AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0021AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0021AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0021AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*19 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 22

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0022_Average_Neg1.txt';
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

emosuj0022AverageNeg1 = table;
emosuj0022AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0022AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0022AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0022AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0022AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0022AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0022AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0022AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0022AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0022AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0022AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0022AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0022AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0022AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0022AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0022AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0022AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0022AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0022AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0022AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0022AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0022AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0022AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0022AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0022AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0022AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0022AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0022AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0022AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0022AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0022AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0022AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0022AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0022AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0022AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0022AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0022AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0022AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0022AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0022AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0022AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0022AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0022AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0022AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0022AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0022AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0022AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0022AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0022AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0022AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0022AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0022AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0022AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0022AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0022AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0022AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0022AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0022AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0022AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0022AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0022AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0022AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0022AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0022AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0022AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0022AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0022AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0022AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0022AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0022AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0022AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0022AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0022AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0022AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0022AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0022AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0022AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0022AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0022AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0022AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0022AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0022AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0022AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0022AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0022AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0022AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0022AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0022AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0022AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0022AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0022AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0022AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0022AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0022AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0022AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0022AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0022AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0022AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0022AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0022AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0022AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0022AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0022AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0022AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0022AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0022AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0022AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0022AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0022AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0022AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0022AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0022AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0022AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0022AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0022AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0022AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0022AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0022AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0022AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0022AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0022AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0022AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0022AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0022AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0022AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0022AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0022AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0022AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0022AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0022AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0022AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0022AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0022AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0022AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0022AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0022AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0022AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0022AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0022AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0022AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0022AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0022AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0022AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0022AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0022AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0022AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0022AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0022AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0022AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0022AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0022AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0022AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0022AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0022AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0022AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0022AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0022AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0022AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0022AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0022AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0022AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0022AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0022AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0022AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0022AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0022AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0022AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0022AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0022AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0022AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0022AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0022AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0022AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0022AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0022AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0022AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0022AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0022AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0022AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0022AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0022AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0022AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0022AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0022AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0022AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0022AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0022AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0022AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0022AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0022AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0022AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0022AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0022AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0022AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0022AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0022AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0022AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0022AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0022AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0022AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0022AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0022AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0022AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0022AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0022AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0022AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0022AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0022AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0022AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0022AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0022AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0022AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0022AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0022AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0022AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0022AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0022AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0022AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0022AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0022AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0022AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0022AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0022AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0022AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0022AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0022AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0022AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0022AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0022AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0022AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0022AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0022AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0022AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0022AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0022AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0022AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0022AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0022AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0022AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0022AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0022AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0022AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0022AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0022AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0022AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0022AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0022AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0022AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0022AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0022AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0022AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0022AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0022AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0022AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0022AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0022AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0022AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0022AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0022AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0022AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0022AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0022AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0022AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0022AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0022AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0022AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0022AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0022AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0022AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0022AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0022AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0022AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0022AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0022AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0022AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0022AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0022AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0022AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0022AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0022AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0022AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0022AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0022AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0022AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0022AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0022AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0022AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0022AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0022AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0022AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0022AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0022AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0022AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0022AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0022AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0022AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0022AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0022AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0022AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0022AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0022AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0022AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0022AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0022AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0022AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0022AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0022AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0022AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0022AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0022AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0022AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0022AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0022AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0022AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0022AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0022AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0022AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0022AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0022AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0022AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0022AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0022AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0022AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0022AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0022AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0022AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0022AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*20 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 23

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0023_Average_Neg1.txt';
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

emosuj0023AverageNeg1 = table;
emosuj0023AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0023AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0023AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0023AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0023AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0023AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0023AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0023AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0023AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0023AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0023AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0023AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0023AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0023AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0023AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0023AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0023AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0023AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0023AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0023AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0023AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0023AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0023AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0023AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0023AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0023AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0023AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0023AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0023AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0023AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0023AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0023AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0023AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0023AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0023AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0023AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0023AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0023AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0023AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0023AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0023AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0023AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0023AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0023AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0023AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0023AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0023AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0023AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0023AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0023AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0023AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0023AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0023AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0023AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0023AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0023AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0023AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0023AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0023AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0023AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0023AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0023AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0023AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0023AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0023AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0023AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0023AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0023AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0023AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0023AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0023AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0023AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0023AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0023AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0023AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0023AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0023AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0023AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0023AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0023AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0023AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0023AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0023AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0023AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0023AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0023AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0023AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0023AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0023AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0023AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0023AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0023AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0023AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0023AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0023AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0023AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0023AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0023AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0023AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0023AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0023AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0023AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0023AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0023AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0023AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0023AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0023AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0023AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0023AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0023AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0023AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0023AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0023AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0023AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0023AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0023AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0023AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0023AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0023AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0023AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0023AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0023AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0023AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0023AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0023AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0023AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0023AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0023AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0023AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0023AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0023AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0023AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0023AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0023AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0023AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0023AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0023AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0023AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0023AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0023AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0023AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0023AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0023AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0023AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0023AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0023AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0023AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0023AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0023AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0023AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0023AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0023AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0023AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0023AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0023AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0023AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0023AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0023AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0023AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0023AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0023AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0023AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0023AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0023AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0023AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0023AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0023AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0023AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0023AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0023AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0023AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0023AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0023AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0023AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0023AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0023AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0023AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0023AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0023AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0023AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0023AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0023AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0023AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0023AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0023AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0023AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0023AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0023AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0023AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0023AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0023AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0023AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0023AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0023AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0023AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0023AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0023AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0023AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0023AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0023AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0023AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0023AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0023AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0023AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0023AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0023AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0023AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0023AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0023AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0023AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0023AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0023AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0023AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0023AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0023AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0023AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0023AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0023AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0023AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0023AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0023AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0023AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0023AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0023AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0023AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0023AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0023AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0023AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0023AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0023AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0023AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0023AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0023AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0023AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0023AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0023AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0023AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0023AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0023AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0023AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0023AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0023AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0023AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0023AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0023AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0023AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0023AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0023AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0023AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0023AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0023AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0023AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0023AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0023AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0023AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0023AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0023AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0023AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0023AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0023AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0023AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0023AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0023AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0023AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0023AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0023AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0023AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0023AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0023AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0023AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0023AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0023AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0023AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0023AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0023AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0023AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0023AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0023AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0023AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0023AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0023AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0023AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0023AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0023AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0023AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0023AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0023AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0023AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0023AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0023AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0023AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0023AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0023AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0023AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0023AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0023AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0023AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0023AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0023AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0023AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0023AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0023AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0023AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0023AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0023AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0023AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0023AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0023AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0023AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0023AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0023AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0023AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0023AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0023AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0023AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0023AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0023AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0023AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0023AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0023AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0023AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0023AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0023AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0023AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0023AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0023AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0023AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*21 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 24

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0024_Average_Neg1.txt';
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

emosuj0024AverageNeg1 = table;
emosuj0024AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0024AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0024AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0024AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0024AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0024AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0024AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0024AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0024AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0024AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0024AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0024AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0024AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0024AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0024AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0024AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0024AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0024AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0024AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0024AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0024AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0024AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0024AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0024AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0024AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0024AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0024AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0024AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0024AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0024AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0024AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0024AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0024AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0024AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0024AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0024AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0024AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0024AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0024AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0024AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0024AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0024AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0024AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0024AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0024AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0024AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0024AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0024AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0024AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0024AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0024AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0024AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0024AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0024AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0024AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0024AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0024AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0024AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0024AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0024AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0024AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0024AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0024AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0024AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0024AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0024AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0024AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0024AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0024AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0024AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0024AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0024AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0024AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0024AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0024AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0024AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0024AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0024AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0024AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0024AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0024AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0024AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0024AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0024AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0024AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0024AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0024AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0024AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0024AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0024AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0024AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0024AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0024AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0024AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0024AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0024AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0024AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0024AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0024AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0024AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0024AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0024AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0024AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0024AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0024AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0024AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0024AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0024AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0024AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0024AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0024AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0024AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0024AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0024AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0024AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0024AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0024AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0024AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0024AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0024AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0024AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0024AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0024AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0024AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0024AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0024AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0024AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0024AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0024AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0024AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0024AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0024AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0024AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0024AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0024AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0024AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0024AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0024AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0024AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0024AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0024AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0024AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0024AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0024AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0024AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0024AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0024AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0024AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0024AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0024AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0024AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0024AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0024AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0024AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0024AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0024AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0024AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0024AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0024AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0024AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0024AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0024AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0024AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0024AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0024AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0024AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0024AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0024AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0024AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0024AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0024AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0024AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0024AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0024AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0024AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0024AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0024AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0024AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0024AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0024AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0024AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0024AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0024AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0024AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0024AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0024AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0024AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0024AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0024AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0024AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0024AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0024AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0024AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0024AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0024AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0024AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0024AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0024AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0024AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0024AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0024AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0024AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0024AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0024AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0024AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0024AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0024AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0024AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0024AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0024AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0024AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0024AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0024AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0024AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0024AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0024AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0024AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0024AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0024AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0024AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0024AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0024AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0024AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0024AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0024AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0024AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0024AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0024AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0024AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0024AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0024AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0024AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0024AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0024AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0024AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0024AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0024AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0024AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0024AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0024AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0024AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0024AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0024AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0024AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0024AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0024AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0024AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0024AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0024AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0024AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0024AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0024AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0024AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0024AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0024AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0024AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0024AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0024AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0024AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0024AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0024AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0024AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0024AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0024AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0024AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0024AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0024AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0024AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0024AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0024AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0024AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0024AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0024AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0024AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0024AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0024AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0024AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0024AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0024AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0024AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0024AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0024AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0024AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0024AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0024AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0024AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0024AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0024AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0024AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0024AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0024AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0024AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0024AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0024AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0024AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0024AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0024AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0024AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0024AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0024AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0024AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0024AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0024AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0024AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0024AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0024AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0024AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0024AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0024AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0024AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0024AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0024AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0024AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0024AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0024AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0024AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0024AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0024AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0024AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0024AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0024AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0024AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0024AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0024AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0024AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0024AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0024AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*22 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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

%% Subject 25

%Once data is a table in the workspace
%Once data is a table in the workspace
%Export data from table to variable form
%Importing table
filename = 'C:\Users\gabri\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\emo_suj0025_Average_Neg1.txt';
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

emosuj0025AverageNeg1 = table;
emosuj0025AverageNeg1.Fp1 = rawStringColumns(:, 1);
emosuj0025AverageNeg1.VarName2 = cell2mat(rawNumericColumns(:, 1));
emosuj0025AverageNeg1.VarName3 = cell2mat(rawNumericColumns(:, 2));
emosuj0025AverageNeg1.VarName4 = cell2mat(rawNumericColumns(:, 3));
emosuj0025AverageNeg1.VarName5 = cell2mat(rawNumericColumns(:, 4));
emosuj0025AverageNeg1.VarName6 = cell2mat(rawNumericColumns(:, 5));
emosuj0025AverageNeg1.VarName7 = cell2mat(rawNumericColumns(:, 6));
emosuj0025AverageNeg1.VarName8 = cell2mat(rawNumericColumns(:, 7));
emosuj0025AverageNeg1.VarName9 = cell2mat(rawNumericColumns(:, 8));
emosuj0025AverageNeg1.VarName10 = cell2mat(rawNumericColumns(:, 9));
emosuj0025AverageNeg1.VarName11 = cell2mat(rawNumericColumns(:, 10));
emosuj0025AverageNeg1.VarName12 = cell2mat(rawNumericColumns(:, 11));
emosuj0025AverageNeg1.VarName13 = cell2mat(rawNumericColumns(:, 12));
emosuj0025AverageNeg1.VarName14 = cell2mat(rawNumericColumns(:, 13));
emosuj0025AverageNeg1.VarName15 = cell2mat(rawNumericColumns(:, 14));
emosuj0025AverageNeg1.VarName16 = cell2mat(rawNumericColumns(:, 15));
emosuj0025AverageNeg1.VarName17 = cell2mat(rawNumericColumns(:, 16));
emosuj0025AverageNeg1.VarName18 = cell2mat(rawNumericColumns(:, 17));
emosuj0025AverageNeg1.VarName19 = cell2mat(rawNumericColumns(:, 18));
emosuj0025AverageNeg1.VarName20 = cell2mat(rawNumericColumns(:, 19));
emosuj0025AverageNeg1.VarName21 = cell2mat(rawNumericColumns(:, 20));
emosuj0025AverageNeg1.VarName22 = cell2mat(rawNumericColumns(:, 21));
emosuj0025AverageNeg1.VarName23 = cell2mat(rawNumericColumns(:, 22));
emosuj0025AverageNeg1.VarName24 = cell2mat(rawNumericColumns(:, 23));
emosuj0025AverageNeg1.VarName25 = cell2mat(rawNumericColumns(:, 24));
emosuj0025AverageNeg1.VarName26 = cell2mat(rawNumericColumns(:, 25));
emosuj0025AverageNeg1.VarName27 = cell2mat(rawNumericColumns(:, 26));
emosuj0025AverageNeg1.VarName28 = cell2mat(rawNumericColumns(:, 27));
emosuj0025AverageNeg1.VarName29 = cell2mat(rawNumericColumns(:, 28));
emosuj0025AverageNeg1.VarName30 = cell2mat(rawNumericColumns(:, 29));
emosuj0025AverageNeg1.VarName31 = cell2mat(rawNumericColumns(:, 30));
emosuj0025AverageNeg1.VarName32 = cell2mat(rawNumericColumns(:, 31));
emosuj0025AverageNeg1.VarName33 = cell2mat(rawNumericColumns(:, 32));
emosuj0025AverageNeg1.VarName34 = cell2mat(rawNumericColumns(:, 33));
emosuj0025AverageNeg1.VarName35 = cell2mat(rawNumericColumns(:, 34));
emosuj0025AverageNeg1.VarName36 = cell2mat(rawNumericColumns(:, 35));
emosuj0025AverageNeg1.VarName37 = cell2mat(rawNumericColumns(:, 36));
emosuj0025AverageNeg1.VarName38 = cell2mat(rawNumericColumns(:, 37));
emosuj0025AverageNeg1.VarName39 = cell2mat(rawNumericColumns(:, 38));
emosuj0025AverageNeg1.VarName40 = cell2mat(rawNumericColumns(:, 39));
emosuj0025AverageNeg1.VarName41 = cell2mat(rawNumericColumns(:, 40));
emosuj0025AverageNeg1.VarName42 = cell2mat(rawNumericColumns(:, 41));
emosuj0025AverageNeg1.VarName43 = cell2mat(rawNumericColumns(:, 42));
emosuj0025AverageNeg1.VarName44 = cell2mat(rawNumericColumns(:, 43));
emosuj0025AverageNeg1.VarName45 = cell2mat(rawNumericColumns(:, 44));
emosuj0025AverageNeg1.VarName46 = cell2mat(rawNumericColumns(:, 45));
emosuj0025AverageNeg1.VarName47 = cell2mat(rawNumericColumns(:, 46));
emosuj0025AverageNeg1.VarName48 = cell2mat(rawNumericColumns(:, 47));
emosuj0025AverageNeg1.VarName49 = cell2mat(rawNumericColumns(:, 48));
emosuj0025AverageNeg1.VarName50 = cell2mat(rawNumericColumns(:, 49));
emosuj0025AverageNeg1.VarName51 = cell2mat(rawNumericColumns(:, 50));
emosuj0025AverageNeg1.VarName52 = cell2mat(rawNumericColumns(:, 51));
emosuj0025AverageNeg1.VarName53 = cell2mat(rawNumericColumns(:, 52));
emosuj0025AverageNeg1.VarName54 = cell2mat(rawNumericColumns(:, 53));
emosuj0025AverageNeg1.VarName55 = cell2mat(rawNumericColumns(:, 54));
emosuj0025AverageNeg1.VarName56 = cell2mat(rawNumericColumns(:, 55));
emosuj0025AverageNeg1.VarName57 = cell2mat(rawNumericColumns(:, 56));
emosuj0025AverageNeg1.VarName58 = cell2mat(rawNumericColumns(:, 57));
emosuj0025AverageNeg1.VarName59 = cell2mat(rawNumericColumns(:, 58));
emosuj0025AverageNeg1.VarName60 = cell2mat(rawNumericColumns(:, 59));
emosuj0025AverageNeg1.VarName61 = cell2mat(rawNumericColumns(:, 60));
emosuj0025AverageNeg1.VarName62 = cell2mat(rawNumericColumns(:, 61));
emosuj0025AverageNeg1.VarName63 = cell2mat(rawNumericColumns(:, 62));
emosuj0025AverageNeg1.VarName64 = cell2mat(rawNumericColumns(:, 63));
emosuj0025AverageNeg1.VarName65 = cell2mat(rawNumericColumns(:, 64));
emosuj0025AverageNeg1.VarName66 = cell2mat(rawNumericColumns(:, 65));
emosuj0025AverageNeg1.VarName67 = cell2mat(rawNumericColumns(:, 66));
emosuj0025AverageNeg1.VarName68 = cell2mat(rawNumericColumns(:, 67));
emosuj0025AverageNeg1.VarName69 = cell2mat(rawNumericColumns(:, 68));
emosuj0025AverageNeg1.VarName70 = cell2mat(rawNumericColumns(:, 69));
emosuj0025AverageNeg1.VarName71 = cell2mat(rawNumericColumns(:, 70));
emosuj0025AverageNeg1.VarName72 = cell2mat(rawNumericColumns(:, 71));
emosuj0025AverageNeg1.VarName73 = cell2mat(rawNumericColumns(:, 72));
emosuj0025AverageNeg1.VarName74 = cell2mat(rawNumericColumns(:, 73));
emosuj0025AverageNeg1.VarName75 = cell2mat(rawNumericColumns(:, 74));
emosuj0025AverageNeg1.VarName76 = cell2mat(rawNumericColumns(:, 75));
emosuj0025AverageNeg1.VarName77 = cell2mat(rawNumericColumns(:, 76));
emosuj0025AverageNeg1.VarName78 = cell2mat(rawNumericColumns(:, 77));
emosuj0025AverageNeg1.VarName79 = cell2mat(rawNumericColumns(:, 78));
emosuj0025AverageNeg1.VarName80 = cell2mat(rawNumericColumns(:, 79));
emosuj0025AverageNeg1.VarName81 = cell2mat(rawNumericColumns(:, 80));
emosuj0025AverageNeg1.VarName82 = cell2mat(rawNumericColumns(:, 81));
emosuj0025AverageNeg1.VarName83 = cell2mat(rawNumericColumns(:, 82));
emosuj0025AverageNeg1.VarName84 = cell2mat(rawNumericColumns(:, 83));
emosuj0025AverageNeg1.VarName85 = cell2mat(rawNumericColumns(:, 84));
emosuj0025AverageNeg1.VarName86 = cell2mat(rawNumericColumns(:, 85));
emosuj0025AverageNeg1.VarName87 = cell2mat(rawNumericColumns(:, 86));
emosuj0025AverageNeg1.VarName88 = cell2mat(rawNumericColumns(:, 87));
emosuj0025AverageNeg1.VarName89 = cell2mat(rawNumericColumns(:, 88));
emosuj0025AverageNeg1.VarName90 = cell2mat(rawNumericColumns(:, 89));
emosuj0025AverageNeg1.VarName91 = cell2mat(rawNumericColumns(:, 90));
emosuj0025AverageNeg1.VarName92 = cell2mat(rawNumericColumns(:, 91));
emosuj0025AverageNeg1.VarName93 = cell2mat(rawNumericColumns(:, 92));
emosuj0025AverageNeg1.VarName94 = cell2mat(rawNumericColumns(:, 93));
emosuj0025AverageNeg1.VarName95 = cell2mat(rawNumericColumns(:, 94));
emosuj0025AverageNeg1.VarName96 = cell2mat(rawNumericColumns(:, 95));
emosuj0025AverageNeg1.VarName97 = cell2mat(rawNumericColumns(:, 96));
emosuj0025AverageNeg1.VarName98 = cell2mat(rawNumericColumns(:, 97));
emosuj0025AverageNeg1.VarName99 = cell2mat(rawNumericColumns(:, 98));
emosuj0025AverageNeg1.VarName100 = cell2mat(rawNumericColumns(:, 99));
emosuj0025AverageNeg1.VarName101 = cell2mat(rawNumericColumns(:, 100));
emosuj0025AverageNeg1.VarName102 = cell2mat(rawNumericColumns(:, 101));
emosuj0025AverageNeg1.VarName103 = cell2mat(rawNumericColumns(:, 102));
emosuj0025AverageNeg1.VarName104 = cell2mat(rawNumericColumns(:, 103));
emosuj0025AverageNeg1.VarName105 = cell2mat(rawNumericColumns(:, 104));
emosuj0025AverageNeg1.VarName106 = cell2mat(rawNumericColumns(:, 105));
emosuj0025AverageNeg1.VarName107 = cell2mat(rawNumericColumns(:, 106));
emosuj0025AverageNeg1.VarName108 = cell2mat(rawNumericColumns(:, 107));
emosuj0025AverageNeg1.VarName109 = cell2mat(rawNumericColumns(:, 108));
emosuj0025AverageNeg1.VarName110 = cell2mat(rawNumericColumns(:, 109));
emosuj0025AverageNeg1.VarName111 = cell2mat(rawNumericColumns(:, 110));
emosuj0025AverageNeg1.VarName112 = cell2mat(rawNumericColumns(:, 111));
emosuj0025AverageNeg1.VarName113 = cell2mat(rawNumericColumns(:, 112));
emosuj0025AverageNeg1.VarName114 = cell2mat(rawNumericColumns(:, 113));
emosuj0025AverageNeg1.VarName115 = cell2mat(rawNumericColumns(:, 114));
emosuj0025AverageNeg1.VarName116 = cell2mat(rawNumericColumns(:, 115));
emosuj0025AverageNeg1.VarName117 = cell2mat(rawNumericColumns(:, 116));
emosuj0025AverageNeg1.VarName118 = cell2mat(rawNumericColumns(:, 117));
emosuj0025AverageNeg1.VarName119 = cell2mat(rawNumericColumns(:, 118));
emosuj0025AverageNeg1.VarName120 = cell2mat(rawNumericColumns(:, 119));
emosuj0025AverageNeg1.VarName121 = cell2mat(rawNumericColumns(:, 120));
emosuj0025AverageNeg1.VarName122 = cell2mat(rawNumericColumns(:, 121));
emosuj0025AverageNeg1.VarName123 = cell2mat(rawNumericColumns(:, 122));
emosuj0025AverageNeg1.VarName124 = cell2mat(rawNumericColumns(:, 123));
emosuj0025AverageNeg1.VarName125 = cell2mat(rawNumericColumns(:, 124));
emosuj0025AverageNeg1.VarName126 = cell2mat(rawNumericColumns(:, 125));
emosuj0025AverageNeg1.VarName127 = cell2mat(rawNumericColumns(:, 126));
emosuj0025AverageNeg1.VarName128 = cell2mat(rawNumericColumns(:, 127));
emosuj0025AverageNeg1.VarName129 = cell2mat(rawNumericColumns(:, 128));
emosuj0025AverageNeg1.VarName130 = cell2mat(rawNumericColumns(:, 129));
emosuj0025AverageNeg1.VarName131 = cell2mat(rawNumericColumns(:, 130));
emosuj0025AverageNeg1.VarName132 = cell2mat(rawNumericColumns(:, 131));
emosuj0025AverageNeg1.VarName133 = cell2mat(rawNumericColumns(:, 132));
emosuj0025AverageNeg1.VarName134 = cell2mat(rawNumericColumns(:, 133));
emosuj0025AverageNeg1.VarName135 = cell2mat(rawNumericColumns(:, 134));
emosuj0025AverageNeg1.VarName136 = cell2mat(rawNumericColumns(:, 135));
emosuj0025AverageNeg1.VarName137 = cell2mat(rawNumericColumns(:, 136));
emosuj0025AverageNeg1.VarName138 = cell2mat(rawNumericColumns(:, 137));
emosuj0025AverageNeg1.VarName139 = cell2mat(rawNumericColumns(:, 138));
emosuj0025AverageNeg1.VarName140 = cell2mat(rawNumericColumns(:, 139));
emosuj0025AverageNeg1.VarName141 = cell2mat(rawNumericColumns(:, 140));
emosuj0025AverageNeg1.VarName142 = cell2mat(rawNumericColumns(:, 141));
emosuj0025AverageNeg1.VarName143 = cell2mat(rawNumericColumns(:, 142));
emosuj0025AverageNeg1.VarName144 = cell2mat(rawNumericColumns(:, 143));
emosuj0025AverageNeg1.VarName145 = cell2mat(rawNumericColumns(:, 144));
emosuj0025AverageNeg1.VarName146 = cell2mat(rawNumericColumns(:, 145));
emosuj0025AverageNeg1.VarName147 = cell2mat(rawNumericColumns(:, 146));
emosuj0025AverageNeg1.VarName148 = cell2mat(rawNumericColumns(:, 147));
emosuj0025AverageNeg1.VarName149 = cell2mat(rawNumericColumns(:, 148));
emosuj0025AverageNeg1.VarName150 = cell2mat(rawNumericColumns(:, 149));
emosuj0025AverageNeg1.VarName151 = cell2mat(rawNumericColumns(:, 150));
emosuj0025AverageNeg1.VarName152 = cell2mat(rawNumericColumns(:, 151));
emosuj0025AverageNeg1.VarName153 = cell2mat(rawNumericColumns(:, 152));
emosuj0025AverageNeg1.VarName154 = cell2mat(rawNumericColumns(:, 153));
emosuj0025AverageNeg1.VarName155 = cell2mat(rawNumericColumns(:, 154));
emosuj0025AverageNeg1.VarName156 = cell2mat(rawNumericColumns(:, 155));
emosuj0025AverageNeg1.VarName157 = cell2mat(rawNumericColumns(:, 156));
emosuj0025AverageNeg1.VarName158 = cell2mat(rawNumericColumns(:, 157));
emosuj0025AverageNeg1.VarName159 = cell2mat(rawNumericColumns(:, 158));
emosuj0025AverageNeg1.VarName160 = cell2mat(rawNumericColumns(:, 159));
emosuj0025AverageNeg1.VarName161 = cell2mat(rawNumericColumns(:, 160));
emosuj0025AverageNeg1.VarName162 = cell2mat(rawNumericColumns(:, 161));
emosuj0025AverageNeg1.VarName163 = cell2mat(rawNumericColumns(:, 162));
emosuj0025AverageNeg1.VarName164 = cell2mat(rawNumericColumns(:, 163));
emosuj0025AverageNeg1.VarName165 = cell2mat(rawNumericColumns(:, 164));
emosuj0025AverageNeg1.VarName166 = cell2mat(rawNumericColumns(:, 165));
emosuj0025AverageNeg1.VarName167 = cell2mat(rawNumericColumns(:, 166));
emosuj0025AverageNeg1.VarName168 = cell2mat(rawNumericColumns(:, 167));
emosuj0025AverageNeg1.VarName169 = cell2mat(rawNumericColumns(:, 168));
emosuj0025AverageNeg1.VarName170 = cell2mat(rawNumericColumns(:, 169));
emosuj0025AverageNeg1.VarName171 = cell2mat(rawNumericColumns(:, 170));
emosuj0025AverageNeg1.VarName172 = cell2mat(rawNumericColumns(:, 171));
emosuj0025AverageNeg1.VarName173 = cell2mat(rawNumericColumns(:, 172));
emosuj0025AverageNeg1.VarName174 = cell2mat(rawNumericColumns(:, 173));
emosuj0025AverageNeg1.VarName175 = cell2mat(rawNumericColumns(:, 174));
emosuj0025AverageNeg1.VarName176 = cell2mat(rawNumericColumns(:, 175));
emosuj0025AverageNeg1.VarName177 = cell2mat(rawNumericColumns(:, 176));
emosuj0025AverageNeg1.VarName178 = cell2mat(rawNumericColumns(:, 177));
emosuj0025AverageNeg1.VarName179 = cell2mat(rawNumericColumns(:, 178));
emosuj0025AverageNeg1.VarName180 = cell2mat(rawNumericColumns(:, 179));
emosuj0025AverageNeg1.VarName181 = cell2mat(rawNumericColumns(:, 180));
emosuj0025AverageNeg1.VarName182 = cell2mat(rawNumericColumns(:, 181));
emosuj0025AverageNeg1.VarName183 = cell2mat(rawNumericColumns(:, 182));
emosuj0025AverageNeg1.VarName184 = cell2mat(rawNumericColumns(:, 183));
emosuj0025AverageNeg1.VarName185 = cell2mat(rawNumericColumns(:, 184));
emosuj0025AverageNeg1.VarName186 = cell2mat(rawNumericColumns(:, 185));
emosuj0025AverageNeg1.VarName187 = cell2mat(rawNumericColumns(:, 186));
emosuj0025AverageNeg1.VarName188 = cell2mat(rawNumericColumns(:, 187));
emosuj0025AverageNeg1.VarName189 = cell2mat(rawNumericColumns(:, 188));
emosuj0025AverageNeg1.VarName190 = cell2mat(rawNumericColumns(:, 189));
emosuj0025AverageNeg1.VarName191 = cell2mat(rawNumericColumns(:, 190));
emosuj0025AverageNeg1.VarName192 = cell2mat(rawNumericColumns(:, 191));
emosuj0025AverageNeg1.VarName193 = cell2mat(rawNumericColumns(:, 192));
emosuj0025AverageNeg1.VarName194 = cell2mat(rawNumericColumns(:, 193));
emosuj0025AverageNeg1.VarName195 = cell2mat(rawNumericColumns(:, 194));
emosuj0025AverageNeg1.VarName196 = cell2mat(rawNumericColumns(:, 195));
emosuj0025AverageNeg1.VarName197 = cell2mat(rawNumericColumns(:, 196));
emosuj0025AverageNeg1.VarName198 = cell2mat(rawNumericColumns(:, 197));
emosuj0025AverageNeg1.VarName199 = cell2mat(rawNumericColumns(:, 198));
emosuj0025AverageNeg1.VarName200 = cell2mat(rawNumericColumns(:, 199));
emosuj0025AverageNeg1.VarName201 = cell2mat(rawNumericColumns(:, 200));
emosuj0025AverageNeg1.VarName202 = cell2mat(rawNumericColumns(:, 201));
emosuj0025AverageNeg1.VarName203 = cell2mat(rawNumericColumns(:, 202));
emosuj0025AverageNeg1.VarName204 = cell2mat(rawNumericColumns(:, 203));
emosuj0025AverageNeg1.VarName205 = cell2mat(rawNumericColumns(:, 204));
emosuj0025AverageNeg1.VarName206 = cell2mat(rawNumericColumns(:, 205));
emosuj0025AverageNeg1.VarName207 = cell2mat(rawNumericColumns(:, 206));
emosuj0025AverageNeg1.VarName208 = cell2mat(rawNumericColumns(:, 207));
emosuj0025AverageNeg1.VarName209 = cell2mat(rawNumericColumns(:, 208));
emosuj0025AverageNeg1.VarName210 = cell2mat(rawNumericColumns(:, 209));
emosuj0025AverageNeg1.VarName211 = cell2mat(rawNumericColumns(:, 210));
emosuj0025AverageNeg1.VarName212 = cell2mat(rawNumericColumns(:, 211));
emosuj0025AverageNeg1.VarName213 = cell2mat(rawNumericColumns(:, 212));
emosuj0025AverageNeg1.VarName214 = cell2mat(rawNumericColumns(:, 213));
emosuj0025AverageNeg1.VarName215 = cell2mat(rawNumericColumns(:, 214));
emosuj0025AverageNeg1.VarName216 = cell2mat(rawNumericColumns(:, 215));
emosuj0025AverageNeg1.VarName217 = cell2mat(rawNumericColumns(:, 216));
emosuj0025AverageNeg1.VarName218 = cell2mat(rawNumericColumns(:, 217));
emosuj0025AverageNeg1.VarName219 = cell2mat(rawNumericColumns(:, 218));
emosuj0025AverageNeg1.VarName220 = cell2mat(rawNumericColumns(:, 219));
emosuj0025AverageNeg1.VarName221 = cell2mat(rawNumericColumns(:, 220));
emosuj0025AverageNeg1.VarName222 = cell2mat(rawNumericColumns(:, 221));
emosuj0025AverageNeg1.VarName223 = cell2mat(rawNumericColumns(:, 222));
emosuj0025AverageNeg1.VarName224 = cell2mat(rawNumericColumns(:, 223));
emosuj0025AverageNeg1.VarName225 = cell2mat(rawNumericColumns(:, 224));
emosuj0025AverageNeg1.VarName226 = cell2mat(rawNumericColumns(:, 225));
emosuj0025AverageNeg1.VarName227 = cell2mat(rawNumericColumns(:, 226));
emosuj0025AverageNeg1.VarName228 = cell2mat(rawNumericColumns(:, 227));
emosuj0025AverageNeg1.VarName229 = cell2mat(rawNumericColumns(:, 228));
emosuj0025AverageNeg1.VarName230 = cell2mat(rawNumericColumns(:, 229));
emosuj0025AverageNeg1.VarName231 = cell2mat(rawNumericColumns(:, 230));
emosuj0025AverageNeg1.VarName232 = cell2mat(rawNumericColumns(:, 231));
emosuj0025AverageNeg1.VarName233 = cell2mat(rawNumericColumns(:, 232));
emosuj0025AverageNeg1.VarName234 = cell2mat(rawNumericColumns(:, 233));
emosuj0025AverageNeg1.VarName235 = cell2mat(rawNumericColumns(:, 234));
emosuj0025AverageNeg1.VarName236 = cell2mat(rawNumericColumns(:, 235));
emosuj0025AverageNeg1.VarName237 = cell2mat(rawNumericColumns(:, 236));
emosuj0025AverageNeg1.VarName238 = cell2mat(rawNumericColumns(:, 237));
emosuj0025AverageNeg1.VarName239 = cell2mat(rawNumericColumns(:, 238));
emosuj0025AverageNeg1.VarName240 = cell2mat(rawNumericColumns(:, 239));
emosuj0025AverageNeg1.VarName241 = cell2mat(rawNumericColumns(:, 240));
emosuj0025AverageNeg1.VarName242 = cell2mat(rawNumericColumns(:, 241));
emosuj0025AverageNeg1.VarName243 = cell2mat(rawNumericColumns(:, 242));
emosuj0025AverageNeg1.VarName244 = cell2mat(rawNumericColumns(:, 243));
emosuj0025AverageNeg1.VarName245 = cell2mat(rawNumericColumns(:, 244));
emosuj0025AverageNeg1.VarName246 = cell2mat(rawNumericColumns(:, 245));
emosuj0025AverageNeg1.VarName247 = cell2mat(rawNumericColumns(:, 246));
emosuj0025AverageNeg1.VarName248 = cell2mat(rawNumericColumns(:, 247));
emosuj0025AverageNeg1.VarName249 = cell2mat(rawNumericColumns(:, 248));
emosuj0025AverageNeg1.VarName250 = cell2mat(rawNumericColumns(:, 249));
emosuj0025AverageNeg1.VarName251 = cell2mat(rawNumericColumns(:, 250));
emosuj0025AverageNeg1.VarName252 = cell2mat(rawNumericColumns(:, 251));
emosuj0025AverageNeg1.VarName253 = cell2mat(rawNumericColumns(:, 252));
emosuj0025AverageNeg1.VarName254 = cell2mat(rawNumericColumns(:, 253));
emosuj0025AverageNeg1.VarName255 = cell2mat(rawNumericColumns(:, 254));
emosuj0025AverageNeg1.VarName256 = cell2mat(rawNumericColumns(:, 255));
emosuj0025AverageNeg1.VarName257 = cell2mat(rawNumericColumns(:, 256));
emosuj0025AverageNeg1.VarName258 = cell2mat(rawNumericColumns(:, 257));
emosuj0025AverageNeg1.VarName259 = cell2mat(rawNumericColumns(:, 258));
emosuj0025AverageNeg1.VarName260 = cell2mat(rawNumericColumns(:, 259));
emosuj0025AverageNeg1.VarName261 = cell2mat(rawNumericColumns(:, 260));
emosuj0025AverageNeg1.VarName262 = cell2mat(rawNumericColumns(:, 261));
emosuj0025AverageNeg1.VarName263 = cell2mat(rawNumericColumns(:, 262));
emosuj0025AverageNeg1.VarName264 = cell2mat(rawNumericColumns(:, 263));
emosuj0025AverageNeg1.VarName265 = cell2mat(rawNumericColumns(:, 264));
emosuj0025AverageNeg1.VarName266 = cell2mat(rawNumericColumns(:, 265));
emosuj0025AverageNeg1.VarName267 = cell2mat(rawNumericColumns(:, 266));
emosuj0025AverageNeg1.VarName268 = cell2mat(rawNumericColumns(:, 267));
emosuj0025AverageNeg1.VarName269 = cell2mat(rawNumericColumns(:, 268));
emosuj0025AverageNeg1.VarName270 = cell2mat(rawNumericColumns(:, 269));
emosuj0025AverageNeg1.VarName271 = cell2mat(rawNumericColumns(:, 270));
emosuj0025AverageNeg1.VarName272 = cell2mat(rawNumericColumns(:, 271));
emosuj0025AverageNeg1.VarName273 = cell2mat(rawNumericColumns(:, 272));
emosuj0025AverageNeg1.VarName274 = cell2mat(rawNumericColumns(:, 273));
emosuj0025AverageNeg1.VarName275 = cell2mat(rawNumericColumns(:, 274));
emosuj0025AverageNeg1.VarName276 = cell2mat(rawNumericColumns(:, 275));
emosuj0025AverageNeg1.VarName277 = cell2mat(rawNumericColumns(:, 276));
emosuj0025AverageNeg1.VarName278 = cell2mat(rawNumericColumns(:, 277));
emosuj0025AverageNeg1.VarName279 = cell2mat(rawNumericColumns(:, 278));
emosuj0025AverageNeg1.VarName280 = cell2mat(rawNumericColumns(:, 279));
emosuj0025AverageNeg1.VarName281 = cell2mat(rawNumericColumns(:, 280));
emosuj0025AverageNeg1.VarName282 = cell2mat(rawNumericColumns(:, 281));
emosuj0025AverageNeg1.VarName283 = cell2mat(rawNumericColumns(:, 282));
emosuj0025AverageNeg1.VarName284 = cell2mat(rawNumericColumns(:, 283));
emosuj0025AverageNeg1.VarName285 = cell2mat(rawNumericColumns(:, 284));
emosuj0025AverageNeg1.VarName286 = cell2mat(rawNumericColumns(:, 285));
emosuj0025AverageNeg1.VarName287 = cell2mat(rawNumericColumns(:, 286));
emosuj0025AverageNeg1.VarName288 = cell2mat(rawNumericColumns(:, 287));
emosuj0025AverageNeg1.VarName289 = cell2mat(rawNumericColumns(:, 288));
emosuj0025AverageNeg1.VarName290 = cell2mat(rawNumericColumns(:, 289));
emosuj0025AverageNeg1.VarName291 = cell2mat(rawNumericColumns(:, 290));
emosuj0025AverageNeg1.VarName292 = cell2mat(rawNumericColumns(:, 291));
emosuj0025AverageNeg1.VarName293 = cell2mat(rawNumericColumns(:, 292));
emosuj0025AverageNeg1.VarName294 = cell2mat(rawNumericColumns(:, 293));
emosuj0025AverageNeg1.VarName295 = cell2mat(rawNumericColumns(:, 294));
emosuj0025AverageNeg1.VarName296 = cell2mat(rawNumericColumns(:, 295));
emosuj0025AverageNeg1.VarName297 = cell2mat(rawNumericColumns(:, 296));
emosuj0025AverageNeg1.VarName298 = cell2mat(rawNumericColumns(:, 297));
emosuj0025AverageNeg1.VarName299 = cell2mat(rawNumericColumns(:, 298));
emosuj0025AverageNeg1.VarName300 = cell2mat(rawNumericColumns(:, 299));
emosuj0025AverageNeg1.VarName301 = cell2mat(rawNumericColumns(:, 300));
emosuj0025AverageNeg1.VarName302 = cell2mat(rawNumericColumns(:, 301));
emosuj0025AverageNeg1.VarName303 = cell2mat(rawNumericColumns(:, 302));
emosuj0025AverageNeg1.VarName304 = cell2mat(rawNumericColumns(:, 303));
emosuj0025AverageNeg1.VarName305 = cell2mat(rawNumericColumns(:, 304));
emosuj0025AverageNeg1.VarName306 = cell2mat(rawNumericColumns(:, 305));
emosuj0025AverageNeg1.VarName307 = cell2mat(rawNumericColumns(:, 306));
emosuj0025AverageNeg1.VarName308 = cell2mat(rawNumericColumns(:, 307));
emosuj0025AverageNeg1.VarName309 = cell2mat(rawNumericColumns(:, 308));
emosuj0025AverageNeg1.VarName310 = cell2mat(rawNumericColumns(:, 309));
emosuj0025AverageNeg1.VarName311 = cell2mat(rawNumericColumns(:, 310));
emosuj0025AverageNeg1.VarName312 = cell2mat(rawNumericColumns(:, 311));
emosuj0025AverageNeg1.VarName313 = cell2mat(rawNumericColumns(:, 312));
emosuj0025AverageNeg1.VarName314 = cell2mat(rawNumericColumns(:, 313));
emosuj0025AverageNeg1.VarName315 = cell2mat(rawNumericColumns(:, 314));
emosuj0025AverageNeg1.VarName316 = cell2mat(rawNumericColumns(:, 315));
emosuj0025AverageNeg1.VarName317 = cell2mat(rawNumericColumns(:, 316));
emosuj0025AverageNeg1.VarName318 = cell2mat(rawNumericColumns(:, 317));
emosuj0025AverageNeg1.VarName319 = cell2mat(rawNumericColumns(:, 318));
emosuj0025AverageNeg1.VarName320 = cell2mat(rawNumericColumns(:, 319));
emosuj0025AverageNeg1.VarName321 = cell2mat(rawNumericColumns(:, 320));
emosuj0025AverageNeg1.VarName322 = cell2mat(rawNumericColumns(:, 321));
emosuj0025AverageNeg1.VarName323 = cell2mat(rawNumericColumns(:, 322));
emosuj0025AverageNeg1.VarName324 = cell2mat(rawNumericColumns(:, 323));
emosuj0025AverageNeg1.VarName325 = cell2mat(rawNumericColumns(:, 324));
emosuj0025AverageNeg1.VarName326 = cell2mat(rawNumericColumns(:, 325));
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


%Export data from table to variable form
%first for each subject
T = emosuj0025AverageNeg1; %NCR condition first
Electrodes = T.Fp1;

G = T(:,2:326);
G = G{:,:};
meansujNEG_electrodes = mean(G);
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
G800_1100 = G(:,226:300);

%data that should be copied into the table
dataSelected_NEG800_1100 = data_selectedElectrodes_NEG(:,226:300);

skip = 55
first = 5400*23 + 20
filename = 'C:\Users\gabri\Documents\data_completeTable.xlsx'
% abrir a tabela excel que eu vou chamar de FILENAME

% A é a tabela do matlab

for col=1:size(dataSelected_NEG800_1100,2)
    coluna = dataSelected_NEG800_1100(:, col)
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