%Matlab data analysis
%
%Import treated data for each condition with import tool 
%Delimeters - Space
%Variable Names row - 1
% Also import electrodes localization for further topographic analysis 'Standard1020CapeditedGG.ced'
%
%Once data is a table in the workspace
%Export data from table to variable form

%% Import data from text file.

%% Initialize variables.
filename = 'C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\New_Raw Data.txt';
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
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


%% Split data into numeric and string columns.
rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326]);
rawStringColumns = string(raw(:, 1));


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
NewRawData = table;
NewRawData.Fp1 = rawStringColumns(:, 1);
NewRawData.VarName2 = cell2mat(rawNumericColumns(:, 1));
NewRawData.VarName3 = cell2mat(rawNumericColumns(:, 2));
NewRawData.VarName4 = cell2mat(rawNumericColumns(:, 3));
NewRawData.VarName5 = cell2mat(rawNumericColumns(:, 4));
NewRawData.VarName6 = cell2mat(rawNumericColumns(:, 5));
NewRawData.VarName7 = cell2mat(rawNumericColumns(:, 6));
NewRawData.VarName8 = cell2mat(rawNumericColumns(:, 7));
NewRawData.VarName9 = cell2mat(rawNumericColumns(:, 8));
NewRawData.VarName10 = cell2mat(rawNumericColumns(:, 9));
NewRawData.VarName11 = cell2mat(rawNumericColumns(:, 10));
NewRawData.VarName12 = cell2mat(rawNumericColumns(:, 11));
NewRawData.VarName13 = cell2mat(rawNumericColumns(:, 12));
NewRawData.VarName14 = cell2mat(rawNumericColumns(:, 13));
NewRawData.VarName15 = cell2mat(rawNumericColumns(:, 14));
NewRawData.VarName16 = cell2mat(rawNumericColumns(:, 15));
NewRawData.VarName17 = cell2mat(rawNumericColumns(:, 16));
NewRawData.VarName18 = cell2mat(rawNumericColumns(:, 17));
NewRawData.VarName19 = cell2mat(rawNumericColumns(:, 18));
NewRawData.VarName20 = cell2mat(rawNumericColumns(:, 19));
NewRawData.VarName21 = cell2mat(rawNumericColumns(:, 20));
NewRawData.VarName22 = cell2mat(rawNumericColumns(:, 21));
NewRawData.VarName23 = cell2mat(rawNumericColumns(:, 22));
NewRawData.VarName24 = cell2mat(rawNumericColumns(:, 23));
NewRawData.VarName25 = cell2mat(rawNumericColumns(:, 24));
NewRawData.VarName26 = cell2mat(rawNumericColumns(:, 25));
NewRawData.VarName27 = cell2mat(rawNumericColumns(:, 26));
NewRawData.VarName28 = cell2mat(rawNumericColumns(:, 27));
NewRawData.VarName29 = cell2mat(rawNumericColumns(:, 28));
NewRawData.VarName30 = cell2mat(rawNumericColumns(:, 29));
NewRawData.VarName31 = cell2mat(rawNumericColumns(:, 30));
NewRawData.VarName32 = cell2mat(rawNumericColumns(:, 31));
NewRawData.VarName33 = cell2mat(rawNumericColumns(:, 32));
NewRawData.VarName34 = cell2mat(rawNumericColumns(:, 33));
NewRawData.VarName35 = cell2mat(rawNumericColumns(:, 34));
NewRawData.VarName36 = cell2mat(rawNumericColumns(:, 35));
NewRawData.VarName37 = cell2mat(rawNumericColumns(:, 36));
NewRawData.VarName38 = cell2mat(rawNumericColumns(:, 37));
NewRawData.VarName39 = cell2mat(rawNumericColumns(:, 38));
NewRawData.VarName40 = cell2mat(rawNumericColumns(:, 39));
NewRawData.VarName41 = cell2mat(rawNumericColumns(:, 40));
NewRawData.VarName42 = cell2mat(rawNumericColumns(:, 41));
NewRawData.VarName43 = cell2mat(rawNumericColumns(:, 42));
NewRawData.VarName44 = cell2mat(rawNumericColumns(:, 43));
NewRawData.VarName45 = cell2mat(rawNumericColumns(:, 44));
NewRawData.VarName46 = cell2mat(rawNumericColumns(:, 45));
NewRawData.VarName47 = cell2mat(rawNumericColumns(:, 46));
NewRawData.VarName48 = cell2mat(rawNumericColumns(:, 47));
NewRawData.VarName49 = cell2mat(rawNumericColumns(:, 48));
NewRawData.VarName50 = cell2mat(rawNumericColumns(:, 49));
NewRawData.VarName51 = cell2mat(rawNumericColumns(:, 50));
NewRawData.VarName52 = cell2mat(rawNumericColumns(:, 51));
NewRawData.VarName53 = cell2mat(rawNumericColumns(:, 52));
NewRawData.VarName54 = cell2mat(rawNumericColumns(:, 53));
NewRawData.VarName55 = cell2mat(rawNumericColumns(:, 54));
NewRawData.VarName56 = cell2mat(rawNumericColumns(:, 55));
NewRawData.VarName57 = cell2mat(rawNumericColumns(:, 56));
NewRawData.VarName58 = cell2mat(rawNumericColumns(:, 57));
NewRawData.VarName59 = cell2mat(rawNumericColumns(:, 58));
NewRawData.VarName60 = cell2mat(rawNumericColumns(:, 59));
NewRawData.VarName61 = cell2mat(rawNumericColumns(:, 60));
NewRawData.VarName62 = cell2mat(rawNumericColumns(:, 61));
NewRawData.VarName63 = cell2mat(rawNumericColumns(:, 62));
NewRawData.VarName64 = cell2mat(rawNumericColumns(:, 63));
NewRawData.VarName65 = cell2mat(rawNumericColumns(:, 64));
NewRawData.VarName66 = cell2mat(rawNumericColumns(:, 65));
NewRawData.VarName67 = cell2mat(rawNumericColumns(:, 66));
NewRawData.VarName68 = cell2mat(rawNumericColumns(:, 67));
NewRawData.VarName69 = cell2mat(rawNumericColumns(:, 68));
NewRawData.VarName70 = cell2mat(rawNumericColumns(:, 69));
NewRawData.VarName71 = cell2mat(rawNumericColumns(:, 70));
NewRawData.VarName72 = cell2mat(rawNumericColumns(:, 71));
NewRawData.VarName73 = cell2mat(rawNumericColumns(:, 72));
NewRawData.VarName74 = cell2mat(rawNumericColumns(:, 73));
NewRawData.VarName75 = cell2mat(rawNumericColumns(:, 74));
NewRawData.VarName76 = cell2mat(rawNumericColumns(:, 75));
NewRawData.VarName77 = cell2mat(rawNumericColumns(:, 76));
NewRawData.VarName78 = cell2mat(rawNumericColumns(:, 77));
NewRawData.VarName79 = cell2mat(rawNumericColumns(:, 78));
NewRawData.VarName80 = cell2mat(rawNumericColumns(:, 79));
NewRawData.VarName81 = cell2mat(rawNumericColumns(:, 80));
NewRawData.VarName82 = cell2mat(rawNumericColumns(:, 81));
NewRawData.VarName83 = cell2mat(rawNumericColumns(:, 82));
NewRawData.VarName84 = cell2mat(rawNumericColumns(:, 83));
NewRawData.VarName85 = cell2mat(rawNumericColumns(:, 84));
NewRawData.VarName86 = cell2mat(rawNumericColumns(:, 85));
NewRawData.VarName87 = cell2mat(rawNumericColumns(:, 86));
NewRawData.VarName88 = cell2mat(rawNumericColumns(:, 87));
NewRawData.VarName89 = cell2mat(rawNumericColumns(:, 88));
NewRawData.VarName90 = cell2mat(rawNumericColumns(:, 89));
NewRawData.VarName91 = cell2mat(rawNumericColumns(:, 90));
NewRawData.VarName92 = cell2mat(rawNumericColumns(:, 91));
NewRawData.VarName93 = cell2mat(rawNumericColumns(:, 92));
NewRawData.VarName94 = cell2mat(rawNumericColumns(:, 93));
NewRawData.VarName95 = cell2mat(rawNumericColumns(:, 94));
NewRawData.VarName96 = cell2mat(rawNumericColumns(:, 95));
NewRawData.VarName97 = cell2mat(rawNumericColumns(:, 96));
NewRawData.VarName98 = cell2mat(rawNumericColumns(:, 97));
NewRawData.VarName99 = cell2mat(rawNumericColumns(:, 98));
NewRawData.VarName100 = cell2mat(rawNumericColumns(:, 99));
NewRawData.VarName101 = cell2mat(rawNumericColumns(:, 100));
NewRawData.VarName102 = cell2mat(rawNumericColumns(:, 101));
NewRawData.VarName103 = cell2mat(rawNumericColumns(:, 102));
NewRawData.VarName104 = cell2mat(rawNumericColumns(:, 103));
NewRawData.VarName105 = cell2mat(rawNumericColumns(:, 104));
NewRawData.VarName106 = cell2mat(rawNumericColumns(:, 105));
NewRawData.VarName107 = cell2mat(rawNumericColumns(:, 106));
NewRawData.VarName108 = cell2mat(rawNumericColumns(:, 107));
NewRawData.VarName109 = cell2mat(rawNumericColumns(:, 108));
NewRawData.VarName110 = cell2mat(rawNumericColumns(:, 109));
NewRawData.VarName111 = cell2mat(rawNumericColumns(:, 110));
NewRawData.VarName112 = cell2mat(rawNumericColumns(:, 111));
NewRawData.VarName113 = cell2mat(rawNumericColumns(:, 112));
NewRawData.VarName114 = cell2mat(rawNumericColumns(:, 113));
NewRawData.VarName115 = cell2mat(rawNumericColumns(:, 114));
NewRawData.VarName116 = cell2mat(rawNumericColumns(:, 115));
NewRawData.VarName117 = cell2mat(rawNumericColumns(:, 116));
NewRawData.VarName118 = cell2mat(rawNumericColumns(:, 117));
NewRawData.VarName119 = cell2mat(rawNumericColumns(:, 118));
NewRawData.VarName120 = cell2mat(rawNumericColumns(:, 119));
NewRawData.VarName121 = cell2mat(rawNumericColumns(:, 120));
NewRawData.VarName122 = cell2mat(rawNumericColumns(:, 121));
NewRawData.VarName123 = cell2mat(rawNumericColumns(:, 122));
NewRawData.VarName124 = cell2mat(rawNumericColumns(:, 123));
NewRawData.VarName125 = cell2mat(rawNumericColumns(:, 124));
NewRawData.VarName126 = cell2mat(rawNumericColumns(:, 125));
NewRawData.VarName127 = cell2mat(rawNumericColumns(:, 126));
NewRawData.VarName128 = cell2mat(rawNumericColumns(:, 127));
NewRawData.VarName129 = cell2mat(rawNumericColumns(:, 128));
NewRawData.VarName130 = cell2mat(rawNumericColumns(:, 129));
NewRawData.VarName131 = cell2mat(rawNumericColumns(:, 130));
NewRawData.VarName132 = cell2mat(rawNumericColumns(:, 131));
NewRawData.VarName133 = cell2mat(rawNumericColumns(:, 132));
NewRawData.VarName134 = cell2mat(rawNumericColumns(:, 133));
NewRawData.VarName135 = cell2mat(rawNumericColumns(:, 134));
NewRawData.VarName136 = cell2mat(rawNumericColumns(:, 135));
NewRawData.VarName137 = cell2mat(rawNumericColumns(:, 136));
NewRawData.VarName138 = cell2mat(rawNumericColumns(:, 137));
NewRawData.VarName139 = cell2mat(rawNumericColumns(:, 138));
NewRawData.VarName140 = cell2mat(rawNumericColumns(:, 139));
NewRawData.VarName141 = cell2mat(rawNumericColumns(:, 140));
NewRawData.VarName142 = cell2mat(rawNumericColumns(:, 141));
NewRawData.VarName143 = cell2mat(rawNumericColumns(:, 142));
NewRawData.VarName144 = cell2mat(rawNumericColumns(:, 143));
NewRawData.VarName145 = cell2mat(rawNumericColumns(:, 144));
NewRawData.VarName146 = cell2mat(rawNumericColumns(:, 145));
NewRawData.VarName147 = cell2mat(rawNumericColumns(:, 146));
NewRawData.VarName148 = cell2mat(rawNumericColumns(:, 147));
NewRawData.VarName149 = cell2mat(rawNumericColumns(:, 148));
NewRawData.VarName150 = cell2mat(rawNumericColumns(:, 149));
NewRawData.VarName151 = cell2mat(rawNumericColumns(:, 150));
NewRawData.VarName152 = cell2mat(rawNumericColumns(:, 151));
NewRawData.VarName153 = cell2mat(rawNumericColumns(:, 152));
NewRawData.VarName154 = cell2mat(rawNumericColumns(:, 153));
NewRawData.VarName155 = cell2mat(rawNumericColumns(:, 154));
NewRawData.VarName156 = cell2mat(rawNumericColumns(:, 155));
NewRawData.VarName157 = cell2mat(rawNumericColumns(:, 156));
NewRawData.VarName158 = cell2mat(rawNumericColumns(:, 157));
NewRawData.VarName159 = cell2mat(rawNumericColumns(:, 158));
NewRawData.VarName160 = cell2mat(rawNumericColumns(:, 159));
NewRawData.VarName161 = cell2mat(rawNumericColumns(:, 160));
NewRawData.VarName162 = cell2mat(rawNumericColumns(:, 161));
NewRawData.VarName163 = cell2mat(rawNumericColumns(:, 162));
NewRawData.VarName164 = cell2mat(rawNumericColumns(:, 163));
NewRawData.VarName165 = cell2mat(rawNumericColumns(:, 164));
NewRawData.VarName166 = cell2mat(rawNumericColumns(:, 165));
NewRawData.VarName167 = cell2mat(rawNumericColumns(:, 166));
NewRawData.VarName168 = cell2mat(rawNumericColumns(:, 167));
NewRawData.VarName169 = cell2mat(rawNumericColumns(:, 168));
NewRawData.VarName170 = cell2mat(rawNumericColumns(:, 169));
NewRawData.VarName171 = cell2mat(rawNumericColumns(:, 170));
NewRawData.VarName172 = cell2mat(rawNumericColumns(:, 171));
NewRawData.VarName173 = cell2mat(rawNumericColumns(:, 172));
NewRawData.VarName174 = cell2mat(rawNumericColumns(:, 173));
NewRawData.VarName175 = cell2mat(rawNumericColumns(:, 174));
NewRawData.VarName176 = cell2mat(rawNumericColumns(:, 175));
NewRawData.VarName177 = cell2mat(rawNumericColumns(:, 176));
NewRawData.VarName178 = cell2mat(rawNumericColumns(:, 177));
NewRawData.VarName179 = cell2mat(rawNumericColumns(:, 178));
NewRawData.VarName180 = cell2mat(rawNumericColumns(:, 179));
NewRawData.VarName181 = cell2mat(rawNumericColumns(:, 180));
NewRawData.VarName182 = cell2mat(rawNumericColumns(:, 181));
NewRawData.VarName183 = cell2mat(rawNumericColumns(:, 182));
NewRawData.VarName184 = cell2mat(rawNumericColumns(:, 183));
NewRawData.VarName185 = cell2mat(rawNumericColumns(:, 184));
NewRawData.VarName186 = cell2mat(rawNumericColumns(:, 185));
NewRawData.VarName187 = cell2mat(rawNumericColumns(:, 186));
NewRawData.VarName188 = cell2mat(rawNumericColumns(:, 187));
NewRawData.VarName189 = cell2mat(rawNumericColumns(:, 188));
NewRawData.VarName190 = cell2mat(rawNumericColumns(:, 189));
NewRawData.VarName191 = cell2mat(rawNumericColumns(:, 190));
NewRawData.VarName192 = cell2mat(rawNumericColumns(:, 191));
NewRawData.VarName193 = cell2mat(rawNumericColumns(:, 192));
NewRawData.VarName194 = cell2mat(rawNumericColumns(:, 193));
NewRawData.VarName195 = cell2mat(rawNumericColumns(:, 194));
NewRawData.VarName196 = cell2mat(rawNumericColumns(:, 195));
NewRawData.VarName197 = cell2mat(rawNumericColumns(:, 196));
NewRawData.VarName198 = cell2mat(rawNumericColumns(:, 197));
NewRawData.VarName199 = cell2mat(rawNumericColumns(:, 198));
NewRawData.VarName200 = cell2mat(rawNumericColumns(:, 199));
NewRawData.VarName201 = cell2mat(rawNumericColumns(:, 200));
NewRawData.VarName202 = cell2mat(rawNumericColumns(:, 201));
NewRawData.VarName203 = cell2mat(rawNumericColumns(:, 202));
NewRawData.VarName204 = cell2mat(rawNumericColumns(:, 203));
NewRawData.VarName205 = cell2mat(rawNumericColumns(:, 204));
NewRawData.VarName206 = cell2mat(rawNumericColumns(:, 205));
NewRawData.VarName207 = cell2mat(rawNumericColumns(:, 206));
NewRawData.VarName208 = cell2mat(rawNumericColumns(:, 207));
NewRawData.VarName209 = cell2mat(rawNumericColumns(:, 208));
NewRawData.VarName210 = cell2mat(rawNumericColumns(:, 209));
NewRawData.VarName211 = cell2mat(rawNumericColumns(:, 210));
NewRawData.VarName212 = cell2mat(rawNumericColumns(:, 211));
NewRawData.VarName213 = cell2mat(rawNumericColumns(:, 212));
NewRawData.VarName214 = cell2mat(rawNumericColumns(:, 213));
NewRawData.VarName215 = cell2mat(rawNumericColumns(:, 214));
NewRawData.VarName216 = cell2mat(rawNumericColumns(:, 215));
NewRawData.VarName217 = cell2mat(rawNumericColumns(:, 216));
NewRawData.VarName218 = cell2mat(rawNumericColumns(:, 217));
NewRawData.VarName219 = cell2mat(rawNumericColumns(:, 218));
NewRawData.VarName220 = cell2mat(rawNumericColumns(:, 219));
NewRawData.VarName221 = cell2mat(rawNumericColumns(:, 220));
NewRawData.VarName222 = cell2mat(rawNumericColumns(:, 221));
NewRawData.VarName223 = cell2mat(rawNumericColumns(:, 222));
NewRawData.VarName224 = cell2mat(rawNumericColumns(:, 223));
NewRawData.VarName225 = cell2mat(rawNumericColumns(:, 224));
NewRawData.VarName226 = cell2mat(rawNumericColumns(:, 225));
NewRawData.VarName227 = cell2mat(rawNumericColumns(:, 226));
NewRawData.VarName228 = cell2mat(rawNumericColumns(:, 227));
NewRawData.VarName229 = cell2mat(rawNumericColumns(:, 228));
NewRawData.VarName230 = cell2mat(rawNumericColumns(:, 229));
NewRawData.VarName231 = cell2mat(rawNumericColumns(:, 230));
NewRawData.VarName232 = cell2mat(rawNumericColumns(:, 231));
NewRawData.VarName233 = cell2mat(rawNumericColumns(:, 232));
NewRawData.VarName234 = cell2mat(rawNumericColumns(:, 233));
NewRawData.VarName235 = cell2mat(rawNumericColumns(:, 234));
NewRawData.VarName236 = cell2mat(rawNumericColumns(:, 235));
NewRawData.VarName237 = cell2mat(rawNumericColumns(:, 236));
NewRawData.VarName238 = cell2mat(rawNumericColumns(:, 237));
NewRawData.VarName239 = cell2mat(rawNumericColumns(:, 238));
NewRawData.VarName240 = cell2mat(rawNumericColumns(:, 239));
NewRawData.VarName241 = cell2mat(rawNumericColumns(:, 240));
NewRawData.VarName242 = cell2mat(rawNumericColumns(:, 241));
NewRawData.VarName243 = cell2mat(rawNumericColumns(:, 242));
NewRawData.VarName244 = cell2mat(rawNumericColumns(:, 243));
NewRawData.VarName245 = cell2mat(rawNumericColumns(:, 244));
NewRawData.VarName246 = cell2mat(rawNumericColumns(:, 245));
NewRawData.VarName247 = cell2mat(rawNumericColumns(:, 246));
NewRawData.VarName248 = cell2mat(rawNumericColumns(:, 247));
NewRawData.VarName249 = cell2mat(rawNumericColumns(:, 248));
NewRawData.VarName250 = cell2mat(rawNumericColumns(:, 249));
NewRawData.VarName251 = cell2mat(rawNumericColumns(:, 250));
NewRawData.VarName252 = cell2mat(rawNumericColumns(:, 251));
NewRawData.VarName253 = cell2mat(rawNumericColumns(:, 252));
NewRawData.VarName254 = cell2mat(rawNumericColumns(:, 253));
NewRawData.VarName255 = cell2mat(rawNumericColumns(:, 254));
NewRawData.VarName256 = cell2mat(rawNumericColumns(:, 255));
NewRawData.VarName257 = cell2mat(rawNumericColumns(:, 256));
NewRawData.VarName258 = cell2mat(rawNumericColumns(:, 257));
NewRawData.VarName259 = cell2mat(rawNumericColumns(:, 258));
NewRawData.VarName260 = cell2mat(rawNumericColumns(:, 259));
NewRawData.VarName261 = cell2mat(rawNumericColumns(:, 260));
NewRawData.VarName262 = cell2mat(rawNumericColumns(:, 261));
NewRawData.VarName263 = cell2mat(rawNumericColumns(:, 262));
NewRawData.VarName264 = cell2mat(rawNumericColumns(:, 263));
NewRawData.VarName265 = cell2mat(rawNumericColumns(:, 264));
NewRawData.VarName266 = cell2mat(rawNumericColumns(:, 265));
NewRawData.VarName267 = cell2mat(rawNumericColumns(:, 266));
NewRawData.VarName268 = cell2mat(rawNumericColumns(:, 267));
NewRawData.VarName269 = cell2mat(rawNumericColumns(:, 268));
NewRawData.VarName270 = cell2mat(rawNumericColumns(:, 269));
NewRawData.VarName271 = cell2mat(rawNumericColumns(:, 270));
NewRawData.VarName272 = cell2mat(rawNumericColumns(:, 271));
NewRawData.VarName273 = cell2mat(rawNumericColumns(:, 272));
NewRawData.VarName274 = cell2mat(rawNumericColumns(:, 273));
NewRawData.VarName275 = cell2mat(rawNumericColumns(:, 274));
NewRawData.VarName276 = cell2mat(rawNumericColumns(:, 275));
NewRawData.VarName277 = cell2mat(rawNumericColumns(:, 276));
NewRawData.VarName278 = cell2mat(rawNumericColumns(:, 277));
NewRawData.VarName279 = cell2mat(rawNumericColumns(:, 278));
NewRawData.VarName280 = cell2mat(rawNumericColumns(:, 279));
NewRawData.VarName281 = cell2mat(rawNumericColumns(:, 280));
NewRawData.VarName282 = cell2mat(rawNumericColumns(:, 281));
NewRawData.VarName283 = cell2mat(rawNumericColumns(:, 282));
NewRawData.VarName284 = cell2mat(rawNumericColumns(:, 283));
NewRawData.VarName285 = cell2mat(rawNumericColumns(:, 284));
NewRawData.VarName286 = cell2mat(rawNumericColumns(:, 285));
NewRawData.VarName287 = cell2mat(rawNumericColumns(:, 286));
NewRawData.VarName288 = cell2mat(rawNumericColumns(:, 287));
NewRawData.VarName289 = cell2mat(rawNumericColumns(:, 288));
NewRawData.VarName290 = cell2mat(rawNumericColumns(:, 289));
NewRawData.VarName291 = cell2mat(rawNumericColumns(:, 290));
NewRawData.VarName292 = cell2mat(rawNumericColumns(:, 291));
NewRawData.VarName293 = cell2mat(rawNumericColumns(:, 292));
NewRawData.VarName294 = cell2mat(rawNumericColumns(:, 293));
NewRawData.VarName295 = cell2mat(rawNumericColumns(:, 294));
NewRawData.VarName296 = cell2mat(rawNumericColumns(:, 295));
NewRawData.VarName297 = cell2mat(rawNumericColumns(:, 296));
NewRawData.VarName298 = cell2mat(rawNumericColumns(:, 297));
NewRawData.VarName299 = cell2mat(rawNumericColumns(:, 298));
NewRawData.VarName300 = cell2mat(rawNumericColumns(:, 299));
NewRawData.VarName301 = cell2mat(rawNumericColumns(:, 300));
NewRawData.VarName302 = cell2mat(rawNumericColumns(:, 301));
NewRawData.VarName303 = cell2mat(rawNumericColumns(:, 302));
NewRawData.VarName304 = cell2mat(rawNumericColumns(:, 303));
NewRawData.VarName305 = cell2mat(rawNumericColumns(:, 304));
NewRawData.VarName306 = cell2mat(rawNumericColumns(:, 305));
NewRawData.VarName307 = cell2mat(rawNumericColumns(:, 306));
NewRawData.VarName308 = cell2mat(rawNumericColumns(:, 307));
NewRawData.VarName309 = cell2mat(rawNumericColumns(:, 308));
NewRawData.VarName310 = cell2mat(rawNumericColumns(:, 309));
NewRawData.VarName311 = cell2mat(rawNumericColumns(:, 310));
NewRawData.VarName312 = cell2mat(rawNumericColumns(:, 311));
NewRawData.VarName313 = cell2mat(rawNumericColumns(:, 312));
NewRawData.VarName314 = cell2mat(rawNumericColumns(:, 313));
NewRawData.VarName315 = cell2mat(rawNumericColumns(:, 314));
NewRawData.VarName316 = cell2mat(rawNumericColumns(:, 315));
NewRawData.VarName317 = cell2mat(rawNumericColumns(:, 316));
NewRawData.VarName318 = cell2mat(rawNumericColumns(:, 317));
NewRawData.VarName319 = cell2mat(rawNumericColumns(:, 318));
NewRawData.VarName320 = cell2mat(rawNumericColumns(:, 319));
NewRawData.VarName321 = cell2mat(rawNumericColumns(:, 320));
NewRawData.VarName322 = cell2mat(rawNumericColumns(:, 321));
NewRawData.VarName323 = cell2mat(rawNumericColumns(:, 322));
NewRawData.VarName324 = cell2mat(rawNumericColumns(:, 323));
NewRawData.VarName325 = cell2mat(rawNumericColumns(:, 324));
NewRawData.VarName326 = cell2mat(rawNumericColumns(:, 325));

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;
%%

T = NewRawData; %NEW condition first
Electrodes = T.Fp1;
data_new = T(:,2:326);
data_new = data_new{:,:};
meanNew_electrodes = mean(data_new);
%Name variables based on each Electrode manually once for old and one for new or with a for loop if you
%can manage to figure this out

Fp1 = data_new(1,:);
Fz = data_new(2,:);
F3 = data_new(3,:);
F7 = data_new(4,:);
FT9 = data_new(5,:);
FC5 = data_new(6,:);
FC1 = data_new(7,:);
C3 = data_new(8,:);
T7 = data_new(9,:);
CP5 = data_new(10,:);
CP1 = data_new(11,:);
Pz = data_new(12,:);
P3 = data_new(13,:);
P7 = data_new(14,:);
O1 = data_new(15,:);
Oz = data_new(16,:);
O2 = data_new(17,:);
P4 = data_new(18,:);
P8 = data_new(19,:);
CP6 = data_new(20,:);
CP2 = data_new(21,:);
C4 = data_new(22,:);
T8 = data_new(23,:);
FT10 = data_new(24,:);
FC6 = data_new(25,:);
FC2 = data_new(26,:);
F4 = data_new(27,:);
F8 = data_new(28,:);
Fp2 = data_new(29,:);
AFz = data_new(30,:);



Cz =[CP1; CP2];
Cz = mean(Cz);

F3_new = F3 
Fz_new = Fz
F4_new = F4
C3_new = C3
Cz_new = Cz
C4_new = C4
P3_new = P3
Pz_new = Pz
P4_new = P4

data_selectedElectrodes_new = [F3; F7; FC1; C3; T7; CP5; CP1; P3; P7; P4; P8; CP6; CP2; C4; T8; FC2; F4; F8;];

%
%ROIs
dataROIparietal_new = [P3; CP1]
dataROIfrontal_new = [Fp1; Fp2; F7; F3; Fz; AFz; F4; F8]
dataROIN170_new = [T8; T7; C3; C4]

%% OR
%% Initialize variables.
filename = 'C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\Old_Raw Data.txt';
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
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


%% Split data into numeric and string columns.
rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326]);
rawStringColumns = string(raw(:, 1));


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
OldRawData = table;
OldRawData.Fp1 = rawStringColumns(:, 1);
OldRawData.VarName2 = cell2mat(rawNumericColumns(:, 1));
OldRawData.VarName3 = cell2mat(rawNumericColumns(:, 2));
OldRawData.VarName4 = cell2mat(rawNumericColumns(:, 3));
OldRawData.VarName5 = cell2mat(rawNumericColumns(:, 4));
OldRawData.VarName6 = cell2mat(rawNumericColumns(:, 5));
OldRawData.VarName7 = cell2mat(rawNumericColumns(:, 6));
OldRawData.VarName8 = cell2mat(rawNumericColumns(:, 7));
OldRawData.VarName9 = cell2mat(rawNumericColumns(:, 8));
OldRawData.VarName10 = cell2mat(rawNumericColumns(:, 9));
OldRawData.VarName11 = cell2mat(rawNumericColumns(:, 10));
OldRawData.VarName12 = cell2mat(rawNumericColumns(:, 11));
OldRawData.VarName13 = cell2mat(rawNumericColumns(:, 12));
OldRawData.VarName14 = cell2mat(rawNumericColumns(:, 13));
OldRawData.VarName15 = cell2mat(rawNumericColumns(:, 14));
OldRawData.VarName16 = cell2mat(rawNumericColumns(:, 15));
OldRawData.VarName17 = cell2mat(rawNumericColumns(:, 16));
OldRawData.VarName18 = cell2mat(rawNumericColumns(:, 17));
OldRawData.VarName19 = cell2mat(rawNumericColumns(:, 18));
OldRawData.VarName20 = cell2mat(rawNumericColumns(:, 19));
OldRawData.VarName21 = cell2mat(rawNumericColumns(:, 20));
OldRawData.VarName22 = cell2mat(rawNumericColumns(:, 21));
OldRawData.VarName23 = cell2mat(rawNumericColumns(:, 22));
OldRawData.VarName24 = cell2mat(rawNumericColumns(:, 23));
OldRawData.VarName25 = cell2mat(rawNumericColumns(:, 24));
OldRawData.VarName26 = cell2mat(rawNumericColumns(:, 25));
OldRawData.VarName27 = cell2mat(rawNumericColumns(:, 26));
OldRawData.VarName28 = cell2mat(rawNumericColumns(:, 27));
OldRawData.VarName29 = cell2mat(rawNumericColumns(:, 28));
OldRawData.VarName30 = cell2mat(rawNumericColumns(:, 29));
OldRawData.VarName31 = cell2mat(rawNumericColumns(:, 30));
OldRawData.VarName32 = cell2mat(rawNumericColumns(:, 31));
OldRawData.VarName33 = cell2mat(rawNumericColumns(:, 32));
OldRawData.VarName34 = cell2mat(rawNumericColumns(:, 33));
OldRawData.VarName35 = cell2mat(rawNumericColumns(:, 34));
OldRawData.VarName36 = cell2mat(rawNumericColumns(:, 35));
OldRawData.VarName37 = cell2mat(rawNumericColumns(:, 36));
OldRawData.VarName38 = cell2mat(rawNumericColumns(:, 37));
OldRawData.VarName39 = cell2mat(rawNumericColumns(:, 38));
OldRawData.VarName40 = cell2mat(rawNumericColumns(:, 39));
OldRawData.VarName41 = cell2mat(rawNumericColumns(:, 40));
OldRawData.VarName42 = cell2mat(rawNumericColumns(:, 41));
OldRawData.VarName43 = cell2mat(rawNumericColumns(:, 42));
OldRawData.VarName44 = cell2mat(rawNumericColumns(:, 43));
OldRawData.VarName45 = cell2mat(rawNumericColumns(:, 44));
OldRawData.VarName46 = cell2mat(rawNumericColumns(:, 45));
OldRawData.VarName47 = cell2mat(rawNumericColumns(:, 46));
OldRawData.VarName48 = cell2mat(rawNumericColumns(:, 47));
OldRawData.VarName49 = cell2mat(rawNumericColumns(:, 48));
OldRawData.VarName50 = cell2mat(rawNumericColumns(:, 49));
OldRawData.VarName51 = cell2mat(rawNumericColumns(:, 50));
OldRawData.VarName52 = cell2mat(rawNumericColumns(:, 51));
OldRawData.VarName53 = cell2mat(rawNumericColumns(:, 52));
OldRawData.VarName54 = cell2mat(rawNumericColumns(:, 53));
OldRawData.VarName55 = cell2mat(rawNumericColumns(:, 54));
OldRawData.VarName56 = cell2mat(rawNumericColumns(:, 55));
OldRawData.VarName57 = cell2mat(rawNumericColumns(:, 56));
OldRawData.VarName58 = cell2mat(rawNumericColumns(:, 57));
OldRawData.VarName59 = cell2mat(rawNumericColumns(:, 58));
OldRawData.VarName60 = cell2mat(rawNumericColumns(:, 59));
OldRawData.VarName61 = cell2mat(rawNumericColumns(:, 60));
OldRawData.VarName62 = cell2mat(rawNumericColumns(:, 61));
OldRawData.VarName63 = cell2mat(rawNumericColumns(:, 62));
OldRawData.VarName64 = cell2mat(rawNumericColumns(:, 63));
OldRawData.VarName65 = cell2mat(rawNumericColumns(:, 64));
OldRawData.VarName66 = cell2mat(rawNumericColumns(:, 65));
OldRawData.VarName67 = cell2mat(rawNumericColumns(:, 66));
OldRawData.VarName68 = cell2mat(rawNumericColumns(:, 67));
OldRawData.VarName69 = cell2mat(rawNumericColumns(:, 68));
OldRawData.VarName70 = cell2mat(rawNumericColumns(:, 69));
OldRawData.VarName71 = cell2mat(rawNumericColumns(:, 70));
OldRawData.VarName72 = cell2mat(rawNumericColumns(:, 71));
OldRawData.VarName73 = cell2mat(rawNumericColumns(:, 72));
OldRawData.VarName74 = cell2mat(rawNumericColumns(:, 73));
OldRawData.VarName75 = cell2mat(rawNumericColumns(:, 74));
OldRawData.VarName76 = cell2mat(rawNumericColumns(:, 75));
OldRawData.VarName77 = cell2mat(rawNumericColumns(:, 76));
OldRawData.VarName78 = cell2mat(rawNumericColumns(:, 77));
OldRawData.VarName79 = cell2mat(rawNumericColumns(:, 78));
OldRawData.VarName80 = cell2mat(rawNumericColumns(:, 79));
OldRawData.VarName81 = cell2mat(rawNumericColumns(:, 80));
OldRawData.VarName82 = cell2mat(rawNumericColumns(:, 81));
OldRawData.VarName83 = cell2mat(rawNumericColumns(:, 82));
OldRawData.VarName84 = cell2mat(rawNumericColumns(:, 83));
OldRawData.VarName85 = cell2mat(rawNumericColumns(:, 84));
OldRawData.VarName86 = cell2mat(rawNumericColumns(:, 85));
OldRawData.VarName87 = cell2mat(rawNumericColumns(:, 86));
OldRawData.VarName88 = cell2mat(rawNumericColumns(:, 87));
OldRawData.VarName89 = cell2mat(rawNumericColumns(:, 88));
OldRawData.VarName90 = cell2mat(rawNumericColumns(:, 89));
OldRawData.VarName91 = cell2mat(rawNumericColumns(:, 90));
OldRawData.VarName92 = cell2mat(rawNumericColumns(:, 91));
OldRawData.VarName93 = cell2mat(rawNumericColumns(:, 92));
OldRawData.VarName94 = cell2mat(rawNumericColumns(:, 93));
OldRawData.VarName95 = cell2mat(rawNumericColumns(:, 94));
OldRawData.VarName96 = cell2mat(rawNumericColumns(:, 95));
OldRawData.VarName97 = cell2mat(rawNumericColumns(:, 96));
OldRawData.VarName98 = cell2mat(rawNumericColumns(:, 97));
OldRawData.VarName99 = cell2mat(rawNumericColumns(:, 98));
OldRawData.VarName100 = cell2mat(rawNumericColumns(:, 99));
OldRawData.VarName101 = cell2mat(rawNumericColumns(:, 100));
OldRawData.VarName102 = cell2mat(rawNumericColumns(:, 101));
OldRawData.VarName103 = cell2mat(rawNumericColumns(:, 102));
OldRawData.VarName104 = cell2mat(rawNumericColumns(:, 103));
OldRawData.VarName105 = cell2mat(rawNumericColumns(:, 104));
OldRawData.VarName106 = cell2mat(rawNumericColumns(:, 105));
OldRawData.VarName107 = cell2mat(rawNumericColumns(:, 106));
OldRawData.VarName108 = cell2mat(rawNumericColumns(:, 107));
OldRawData.VarName109 = cell2mat(rawNumericColumns(:, 108));
OldRawData.VarName110 = cell2mat(rawNumericColumns(:, 109));
OldRawData.VarName111 = cell2mat(rawNumericColumns(:, 110));
OldRawData.VarName112 = cell2mat(rawNumericColumns(:, 111));
OldRawData.VarName113 = cell2mat(rawNumericColumns(:, 112));
OldRawData.VarName114 = cell2mat(rawNumericColumns(:, 113));
OldRawData.VarName115 = cell2mat(rawNumericColumns(:, 114));
OldRawData.VarName116 = cell2mat(rawNumericColumns(:, 115));
OldRawData.VarName117 = cell2mat(rawNumericColumns(:, 116));
OldRawData.VarName118 = cell2mat(rawNumericColumns(:, 117));
OldRawData.VarName119 = cell2mat(rawNumericColumns(:, 118));
OldRawData.VarName120 = cell2mat(rawNumericColumns(:, 119));
OldRawData.VarName121 = cell2mat(rawNumericColumns(:, 120));
OldRawData.VarName122 = cell2mat(rawNumericColumns(:, 121));
OldRawData.VarName123 = cell2mat(rawNumericColumns(:, 122));
OldRawData.VarName124 = cell2mat(rawNumericColumns(:, 123));
OldRawData.VarName125 = cell2mat(rawNumericColumns(:, 124));
OldRawData.VarName126 = cell2mat(rawNumericColumns(:, 125));
OldRawData.VarName127 = cell2mat(rawNumericColumns(:, 126));
OldRawData.VarName128 = cell2mat(rawNumericColumns(:, 127));
OldRawData.VarName129 = cell2mat(rawNumericColumns(:, 128));
OldRawData.VarName130 = cell2mat(rawNumericColumns(:, 129));
OldRawData.VarName131 = cell2mat(rawNumericColumns(:, 130));
OldRawData.VarName132 = cell2mat(rawNumericColumns(:, 131));
OldRawData.VarName133 = cell2mat(rawNumericColumns(:, 132));
OldRawData.VarName134 = cell2mat(rawNumericColumns(:, 133));
OldRawData.VarName135 = cell2mat(rawNumericColumns(:, 134));
OldRawData.VarName136 = cell2mat(rawNumericColumns(:, 135));
OldRawData.VarName137 = cell2mat(rawNumericColumns(:, 136));
OldRawData.VarName138 = cell2mat(rawNumericColumns(:, 137));
OldRawData.VarName139 = cell2mat(rawNumericColumns(:, 138));
OldRawData.VarName140 = cell2mat(rawNumericColumns(:, 139));
OldRawData.VarName141 = cell2mat(rawNumericColumns(:, 140));
OldRawData.VarName142 = cell2mat(rawNumericColumns(:, 141));
OldRawData.VarName143 = cell2mat(rawNumericColumns(:, 142));
OldRawData.VarName144 = cell2mat(rawNumericColumns(:, 143));
OldRawData.VarName145 = cell2mat(rawNumericColumns(:, 144));
OldRawData.VarName146 = cell2mat(rawNumericColumns(:, 145));
OldRawData.VarName147 = cell2mat(rawNumericColumns(:, 146));
OldRawData.VarName148 = cell2mat(rawNumericColumns(:, 147));
OldRawData.VarName149 = cell2mat(rawNumericColumns(:, 148));
OldRawData.VarName150 = cell2mat(rawNumericColumns(:, 149));
OldRawData.VarName151 = cell2mat(rawNumericColumns(:, 150));
OldRawData.VarName152 = cell2mat(rawNumericColumns(:, 151));
OldRawData.VarName153 = cell2mat(rawNumericColumns(:, 152));
OldRawData.VarName154 = cell2mat(rawNumericColumns(:, 153));
OldRawData.VarName155 = cell2mat(rawNumericColumns(:, 154));
OldRawData.VarName156 = cell2mat(rawNumericColumns(:, 155));
OldRawData.VarName157 = cell2mat(rawNumericColumns(:, 156));
OldRawData.VarName158 = cell2mat(rawNumericColumns(:, 157));
OldRawData.VarName159 = cell2mat(rawNumericColumns(:, 158));
OldRawData.VarName160 = cell2mat(rawNumericColumns(:, 159));
OldRawData.VarName161 = cell2mat(rawNumericColumns(:, 160));
OldRawData.VarName162 = cell2mat(rawNumericColumns(:, 161));
OldRawData.VarName163 = cell2mat(rawNumericColumns(:, 162));
OldRawData.VarName164 = cell2mat(rawNumericColumns(:, 163));
OldRawData.VarName165 = cell2mat(rawNumericColumns(:, 164));
OldRawData.VarName166 = cell2mat(rawNumericColumns(:, 165));
OldRawData.VarName167 = cell2mat(rawNumericColumns(:, 166));
OldRawData.VarName168 = cell2mat(rawNumericColumns(:, 167));
OldRawData.VarName169 = cell2mat(rawNumericColumns(:, 168));
OldRawData.VarName170 = cell2mat(rawNumericColumns(:, 169));
OldRawData.VarName171 = cell2mat(rawNumericColumns(:, 170));
OldRawData.VarName172 = cell2mat(rawNumericColumns(:, 171));
OldRawData.VarName173 = cell2mat(rawNumericColumns(:, 172));
OldRawData.VarName174 = cell2mat(rawNumericColumns(:, 173));
OldRawData.VarName175 = cell2mat(rawNumericColumns(:, 174));
OldRawData.VarName176 = cell2mat(rawNumericColumns(:, 175));
OldRawData.VarName177 = cell2mat(rawNumericColumns(:, 176));
OldRawData.VarName178 = cell2mat(rawNumericColumns(:, 177));
OldRawData.VarName179 = cell2mat(rawNumericColumns(:, 178));
OldRawData.VarName180 = cell2mat(rawNumericColumns(:, 179));
OldRawData.VarName181 = cell2mat(rawNumericColumns(:, 180));
OldRawData.VarName182 = cell2mat(rawNumericColumns(:, 181));
OldRawData.VarName183 = cell2mat(rawNumericColumns(:, 182));
OldRawData.VarName184 = cell2mat(rawNumericColumns(:, 183));
OldRawData.VarName185 = cell2mat(rawNumericColumns(:, 184));
OldRawData.VarName186 = cell2mat(rawNumericColumns(:, 185));
OldRawData.VarName187 = cell2mat(rawNumericColumns(:, 186));
OldRawData.VarName188 = cell2mat(rawNumericColumns(:, 187));
OldRawData.VarName189 = cell2mat(rawNumericColumns(:, 188));
OldRawData.VarName190 = cell2mat(rawNumericColumns(:, 189));
OldRawData.VarName191 = cell2mat(rawNumericColumns(:, 190));
OldRawData.VarName192 = cell2mat(rawNumericColumns(:, 191));
OldRawData.VarName193 = cell2mat(rawNumericColumns(:, 192));
OldRawData.VarName194 = cell2mat(rawNumericColumns(:, 193));
OldRawData.VarName195 = cell2mat(rawNumericColumns(:, 194));
OldRawData.VarName196 = cell2mat(rawNumericColumns(:, 195));
OldRawData.VarName197 = cell2mat(rawNumericColumns(:, 196));
OldRawData.VarName198 = cell2mat(rawNumericColumns(:, 197));
OldRawData.VarName199 = cell2mat(rawNumericColumns(:, 198));
OldRawData.VarName200 = cell2mat(rawNumericColumns(:, 199));
OldRawData.VarName201 = cell2mat(rawNumericColumns(:, 200));
OldRawData.VarName202 = cell2mat(rawNumericColumns(:, 201));
OldRawData.VarName203 = cell2mat(rawNumericColumns(:, 202));
OldRawData.VarName204 = cell2mat(rawNumericColumns(:, 203));
OldRawData.VarName205 = cell2mat(rawNumericColumns(:, 204));
OldRawData.VarName206 = cell2mat(rawNumericColumns(:, 205));
OldRawData.VarName207 = cell2mat(rawNumericColumns(:, 206));
OldRawData.VarName208 = cell2mat(rawNumericColumns(:, 207));
OldRawData.VarName209 = cell2mat(rawNumericColumns(:, 208));
OldRawData.VarName210 = cell2mat(rawNumericColumns(:, 209));
OldRawData.VarName211 = cell2mat(rawNumericColumns(:, 210));
OldRawData.VarName212 = cell2mat(rawNumericColumns(:, 211));
OldRawData.VarName213 = cell2mat(rawNumericColumns(:, 212));
OldRawData.VarName214 = cell2mat(rawNumericColumns(:, 213));
OldRawData.VarName215 = cell2mat(rawNumericColumns(:, 214));
OldRawData.VarName216 = cell2mat(rawNumericColumns(:, 215));
OldRawData.VarName217 = cell2mat(rawNumericColumns(:, 216));
OldRawData.VarName218 = cell2mat(rawNumericColumns(:, 217));
OldRawData.VarName219 = cell2mat(rawNumericColumns(:, 218));
OldRawData.VarName220 = cell2mat(rawNumericColumns(:, 219));
OldRawData.VarName221 = cell2mat(rawNumericColumns(:, 220));
OldRawData.VarName222 = cell2mat(rawNumericColumns(:, 221));
OldRawData.VarName223 = cell2mat(rawNumericColumns(:, 222));
OldRawData.VarName224 = cell2mat(rawNumericColumns(:, 223));
OldRawData.VarName225 = cell2mat(rawNumericColumns(:, 224));
OldRawData.VarName226 = cell2mat(rawNumericColumns(:, 225));
OldRawData.VarName227 = cell2mat(rawNumericColumns(:, 226));
OldRawData.VarName228 = cell2mat(rawNumericColumns(:, 227));
OldRawData.VarName229 = cell2mat(rawNumericColumns(:, 228));
OldRawData.VarName230 = cell2mat(rawNumericColumns(:, 229));
OldRawData.VarName231 = cell2mat(rawNumericColumns(:, 230));
OldRawData.VarName232 = cell2mat(rawNumericColumns(:, 231));
OldRawData.VarName233 = cell2mat(rawNumericColumns(:, 232));
OldRawData.VarName234 = cell2mat(rawNumericColumns(:, 233));
OldRawData.VarName235 = cell2mat(rawNumericColumns(:, 234));
OldRawData.VarName236 = cell2mat(rawNumericColumns(:, 235));
OldRawData.VarName237 = cell2mat(rawNumericColumns(:, 236));
OldRawData.VarName238 = cell2mat(rawNumericColumns(:, 237));
OldRawData.VarName239 = cell2mat(rawNumericColumns(:, 238));
OldRawData.VarName240 = cell2mat(rawNumericColumns(:, 239));
OldRawData.VarName241 = cell2mat(rawNumericColumns(:, 240));
OldRawData.VarName242 = cell2mat(rawNumericColumns(:, 241));
OldRawData.VarName243 = cell2mat(rawNumericColumns(:, 242));
OldRawData.VarName244 = cell2mat(rawNumericColumns(:, 243));
OldRawData.VarName245 = cell2mat(rawNumericColumns(:, 244));
OldRawData.VarName246 = cell2mat(rawNumericColumns(:, 245));
OldRawData.VarName247 = cell2mat(rawNumericColumns(:, 246));
OldRawData.VarName248 = cell2mat(rawNumericColumns(:, 247));
OldRawData.VarName249 = cell2mat(rawNumericColumns(:, 248));
OldRawData.VarName250 = cell2mat(rawNumericColumns(:, 249));
OldRawData.VarName251 = cell2mat(rawNumericColumns(:, 250));
OldRawData.VarName252 = cell2mat(rawNumericColumns(:, 251));
OldRawData.VarName253 = cell2mat(rawNumericColumns(:, 252));
OldRawData.VarName254 = cell2mat(rawNumericColumns(:, 253));
OldRawData.VarName255 = cell2mat(rawNumericColumns(:, 254));
OldRawData.VarName256 = cell2mat(rawNumericColumns(:, 255));
OldRawData.VarName257 = cell2mat(rawNumericColumns(:, 256));
OldRawData.VarName258 = cell2mat(rawNumericColumns(:, 257));
OldRawData.VarName259 = cell2mat(rawNumericColumns(:, 258));
OldRawData.VarName260 = cell2mat(rawNumericColumns(:, 259));
OldRawData.VarName261 = cell2mat(rawNumericColumns(:, 260));
OldRawData.VarName262 = cell2mat(rawNumericColumns(:, 261));
OldRawData.VarName263 = cell2mat(rawNumericColumns(:, 262));
OldRawData.VarName264 = cell2mat(rawNumericColumns(:, 263));
OldRawData.VarName265 = cell2mat(rawNumericColumns(:, 264));
OldRawData.VarName266 = cell2mat(rawNumericColumns(:, 265));
OldRawData.VarName267 = cell2mat(rawNumericColumns(:, 266));
OldRawData.VarName268 = cell2mat(rawNumericColumns(:, 267));
OldRawData.VarName269 = cell2mat(rawNumericColumns(:, 268));
OldRawData.VarName270 = cell2mat(rawNumericColumns(:, 269));
OldRawData.VarName271 = cell2mat(rawNumericColumns(:, 270));
OldRawData.VarName272 = cell2mat(rawNumericColumns(:, 271));
OldRawData.VarName273 = cell2mat(rawNumericColumns(:, 272));
OldRawData.VarName274 = cell2mat(rawNumericColumns(:, 273));
OldRawData.VarName275 = cell2mat(rawNumericColumns(:, 274));
OldRawData.VarName276 = cell2mat(rawNumericColumns(:, 275));
OldRawData.VarName277 = cell2mat(rawNumericColumns(:, 276));
OldRawData.VarName278 = cell2mat(rawNumericColumns(:, 277));
OldRawData.VarName279 = cell2mat(rawNumericColumns(:, 278));
OldRawData.VarName280 = cell2mat(rawNumericColumns(:, 279));
OldRawData.VarName281 = cell2mat(rawNumericColumns(:, 280));
OldRawData.VarName282 = cell2mat(rawNumericColumns(:, 281));
OldRawData.VarName283 = cell2mat(rawNumericColumns(:, 282));
OldRawData.VarName284 = cell2mat(rawNumericColumns(:, 283));
OldRawData.VarName285 = cell2mat(rawNumericColumns(:, 284));
OldRawData.VarName286 = cell2mat(rawNumericColumns(:, 285));
OldRawData.VarName287 = cell2mat(rawNumericColumns(:, 286));
OldRawData.VarName288 = cell2mat(rawNumericColumns(:, 287));
OldRawData.VarName289 = cell2mat(rawNumericColumns(:, 288));
OldRawData.VarName290 = cell2mat(rawNumericColumns(:, 289));
OldRawData.VarName291 = cell2mat(rawNumericColumns(:, 290));
OldRawData.VarName292 = cell2mat(rawNumericColumns(:, 291));
OldRawData.VarName293 = cell2mat(rawNumericColumns(:, 292));
OldRawData.VarName294 = cell2mat(rawNumericColumns(:, 293));
OldRawData.VarName295 = cell2mat(rawNumericColumns(:, 294));
OldRawData.VarName296 = cell2mat(rawNumericColumns(:, 295));
OldRawData.VarName297 = cell2mat(rawNumericColumns(:, 296));
OldRawData.VarName298 = cell2mat(rawNumericColumns(:, 297));
OldRawData.VarName299 = cell2mat(rawNumericColumns(:, 298));
OldRawData.VarName300 = cell2mat(rawNumericColumns(:, 299));
OldRawData.VarName301 = cell2mat(rawNumericColumns(:, 300));
OldRawData.VarName302 = cell2mat(rawNumericColumns(:, 301));
OldRawData.VarName303 = cell2mat(rawNumericColumns(:, 302));
OldRawData.VarName304 = cell2mat(rawNumericColumns(:, 303));
OldRawData.VarName305 = cell2mat(rawNumericColumns(:, 304));
OldRawData.VarName306 = cell2mat(rawNumericColumns(:, 305));
OldRawData.VarName307 = cell2mat(rawNumericColumns(:, 306));
OldRawData.VarName308 = cell2mat(rawNumericColumns(:, 307));
OldRawData.VarName309 = cell2mat(rawNumericColumns(:, 308));
OldRawData.VarName310 = cell2mat(rawNumericColumns(:, 309));
OldRawData.VarName311 = cell2mat(rawNumericColumns(:, 310));
OldRawData.VarName312 = cell2mat(rawNumericColumns(:, 311));
OldRawData.VarName313 = cell2mat(rawNumericColumns(:, 312));
OldRawData.VarName314 = cell2mat(rawNumericColumns(:, 313));
OldRawData.VarName315 = cell2mat(rawNumericColumns(:, 314));
OldRawData.VarName316 = cell2mat(rawNumericColumns(:, 315));
OldRawData.VarName317 = cell2mat(rawNumericColumns(:, 316));
OldRawData.VarName318 = cell2mat(rawNumericColumns(:, 317));
OldRawData.VarName319 = cell2mat(rawNumericColumns(:, 318));
OldRawData.VarName320 = cell2mat(rawNumericColumns(:, 319));
OldRawData.VarName321 = cell2mat(rawNumericColumns(:, 320));
OldRawData.VarName322 = cell2mat(rawNumericColumns(:, 321));
OldRawData.VarName323 = cell2mat(rawNumericColumns(:, 322));
OldRawData.VarName324 = cell2mat(rawNumericColumns(:, 323));
OldRawData.VarName325 = cell2mat(rawNumericColumns(:, 324));
OldRawData.VarName326 = cell2mat(rawNumericColumns(:, 325));

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;
%%
T = OldRawData; %NEW condition first
Electrodes = T.Fp1;
data_old = T(:,2:326);
data_old = data_old{:,:};
meanOld_electrodes = mean(data_old);

Fp1 = data_old(1,:);
Fz = data_old(2,:);
F3 = data_old(3,:);
F7 = data_old(4,:);
FT9 = data_old(5,:);
FC5 = data_old(6,:);
FC1 = data_old(7,:);
C3 = data_old(8,:);
T7 = data_old(9,:);
CP5 = data_old(10,:);
CP1 = data_old(11,:);
Pz = data_old(12,:);
P3 = data_old(13,:);
P7 = data_old(14,:);
O1 = data_old(15,:);
Oz = data_old(16,:);
O2 = data_old(17,:);
P4 = data_old(18,:);
P8 = data_old(19,:);
CP6 = data_old(20,:);
CP2 = data_old(21,:);
C4 = data_old(22,:);
T8 = data_old(23,:);
FT10 = data_old(24,:);
FC6 = data_old(25,:);
FC2 = data_old(26,:);
F4 = data_old(27,:);
F8 = data_old(28,:);
Fp2 = data_old(29,:);
AFz = data_old(30,:);


 Cz =[CP1; CP2];
Cz = mean(Cz);

F3_old = F3 
Fz_old = Fz
F4_old = F4
C3_old = C3
Cz_old = Cz
C4_old = C4
P3_old = P3
Pz_old = Pz
P4_old = P4

%Select electrodes used for statistical analysis%%%% 
data_selectedElectrodes_old = [F3; F7; FC1; C3; T7; CP5; CP1; P3; P7; P4; P8; CP6; CP2; C4; T8; FC2; F4; F8;];
%OR
%
%ROIs
dataROIparietal_old = [P3; CP1]
dataROIfrontal_old = [Fp1; Fp2; F7; F3; Fz; AFz; F4; F8]
dataROIN170_old = [T8; T7; C3; C4]
%% Initialize variables.
filename = 'C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\Neg_Hits_Raw Data.txt';
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
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


%% Split data into numeric and string columns.
rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326]);
rawStringColumns = string(raw(:, 1));


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
NegHitsRawData = table;
NegHitsRawData.Fp1 = rawStringColumns(:, 1);
NegHitsRawData.VarName2 = cell2mat(rawNumericColumns(:, 1));
NegHitsRawData.VarName3 = cell2mat(rawNumericColumns(:, 2));
NegHitsRawData.VarName4 = cell2mat(rawNumericColumns(:, 3));
NegHitsRawData.VarName5 = cell2mat(rawNumericColumns(:, 4));
NegHitsRawData.VarName6 = cell2mat(rawNumericColumns(:, 5));
NegHitsRawData.VarName7 = cell2mat(rawNumericColumns(:, 6));
NegHitsRawData.VarName8 = cell2mat(rawNumericColumns(:, 7));
NegHitsRawData.VarName9 = cell2mat(rawNumericColumns(:, 8));
NegHitsRawData.VarName10 = cell2mat(rawNumericColumns(:, 9));
NegHitsRawData.VarName11 = cell2mat(rawNumericColumns(:, 10));
NegHitsRawData.VarName12 = cell2mat(rawNumericColumns(:, 11));
NegHitsRawData.VarName13 = cell2mat(rawNumericColumns(:, 12));
NegHitsRawData.VarName14 = cell2mat(rawNumericColumns(:, 13));
NegHitsRawData.VarName15 = cell2mat(rawNumericColumns(:, 14));
NegHitsRawData.VarName16 = cell2mat(rawNumericColumns(:, 15));
NegHitsRawData.VarName17 = cell2mat(rawNumericColumns(:, 16));
NegHitsRawData.VarName18 = cell2mat(rawNumericColumns(:, 17));
NegHitsRawData.VarName19 = cell2mat(rawNumericColumns(:, 18));
NegHitsRawData.VarName20 = cell2mat(rawNumericColumns(:, 19));
NegHitsRawData.VarName21 = cell2mat(rawNumericColumns(:, 20));
NegHitsRawData.VarName22 = cell2mat(rawNumericColumns(:, 21));
NegHitsRawData.VarName23 = cell2mat(rawNumericColumns(:, 22));
NegHitsRawData.VarName24 = cell2mat(rawNumericColumns(:, 23));
NegHitsRawData.VarName25 = cell2mat(rawNumericColumns(:, 24));
NegHitsRawData.VarName26 = cell2mat(rawNumericColumns(:, 25));
NegHitsRawData.VarName27 = cell2mat(rawNumericColumns(:, 26));
NegHitsRawData.VarName28 = cell2mat(rawNumericColumns(:, 27));
NegHitsRawData.VarName29 = cell2mat(rawNumericColumns(:, 28));
NegHitsRawData.VarName30 = cell2mat(rawNumericColumns(:, 29));
NegHitsRawData.VarName31 = cell2mat(rawNumericColumns(:, 30));
NegHitsRawData.VarName32 = cell2mat(rawNumericColumns(:, 31));
NegHitsRawData.VarName33 = cell2mat(rawNumericColumns(:, 32));
NegHitsRawData.VarName34 = cell2mat(rawNumericColumns(:, 33));
NegHitsRawData.VarName35 = cell2mat(rawNumericColumns(:, 34));
NegHitsRawData.VarName36 = cell2mat(rawNumericColumns(:, 35));
NegHitsRawData.VarName37 = cell2mat(rawNumericColumns(:, 36));
NegHitsRawData.VarName38 = cell2mat(rawNumericColumns(:, 37));
NegHitsRawData.VarName39 = cell2mat(rawNumericColumns(:, 38));
NegHitsRawData.VarName40 = cell2mat(rawNumericColumns(:, 39));
NegHitsRawData.VarName41 = cell2mat(rawNumericColumns(:, 40));
NegHitsRawData.VarName42 = cell2mat(rawNumericColumns(:, 41));
NegHitsRawData.VarName43 = cell2mat(rawNumericColumns(:, 42));
NegHitsRawData.VarName44 = cell2mat(rawNumericColumns(:, 43));
NegHitsRawData.VarName45 = cell2mat(rawNumericColumns(:, 44));
NegHitsRawData.VarName46 = cell2mat(rawNumericColumns(:, 45));
NegHitsRawData.VarName47 = cell2mat(rawNumericColumns(:, 46));
NegHitsRawData.VarName48 = cell2mat(rawNumericColumns(:, 47));
NegHitsRawData.VarName49 = cell2mat(rawNumericColumns(:, 48));
NegHitsRawData.VarName50 = cell2mat(rawNumericColumns(:, 49));
NegHitsRawData.VarName51 = cell2mat(rawNumericColumns(:, 50));
NegHitsRawData.VarName52 = cell2mat(rawNumericColumns(:, 51));
NegHitsRawData.VarName53 = cell2mat(rawNumericColumns(:, 52));
NegHitsRawData.VarName54 = cell2mat(rawNumericColumns(:, 53));
NegHitsRawData.VarName55 = cell2mat(rawNumericColumns(:, 54));
NegHitsRawData.VarName56 = cell2mat(rawNumericColumns(:, 55));
NegHitsRawData.VarName57 = cell2mat(rawNumericColumns(:, 56));
NegHitsRawData.VarName58 = cell2mat(rawNumericColumns(:, 57));
NegHitsRawData.VarName59 = cell2mat(rawNumericColumns(:, 58));
NegHitsRawData.VarName60 = cell2mat(rawNumericColumns(:, 59));
NegHitsRawData.VarName61 = cell2mat(rawNumericColumns(:, 60));
NegHitsRawData.VarName62 = cell2mat(rawNumericColumns(:, 61));
NegHitsRawData.VarName63 = cell2mat(rawNumericColumns(:, 62));
NegHitsRawData.VarName64 = cell2mat(rawNumericColumns(:, 63));
NegHitsRawData.VarName65 = cell2mat(rawNumericColumns(:, 64));
NegHitsRawData.VarName66 = cell2mat(rawNumericColumns(:, 65));
NegHitsRawData.VarName67 = cell2mat(rawNumericColumns(:, 66));
NegHitsRawData.VarName68 = cell2mat(rawNumericColumns(:, 67));
NegHitsRawData.VarName69 = cell2mat(rawNumericColumns(:, 68));
NegHitsRawData.VarName70 = cell2mat(rawNumericColumns(:, 69));
NegHitsRawData.VarName71 = cell2mat(rawNumericColumns(:, 70));
NegHitsRawData.VarName72 = cell2mat(rawNumericColumns(:, 71));
NegHitsRawData.VarName73 = cell2mat(rawNumericColumns(:, 72));
NegHitsRawData.VarName74 = cell2mat(rawNumericColumns(:, 73));
NegHitsRawData.VarName75 = cell2mat(rawNumericColumns(:, 74));
NegHitsRawData.VarName76 = cell2mat(rawNumericColumns(:, 75));
NegHitsRawData.VarName77 = cell2mat(rawNumericColumns(:, 76));
NegHitsRawData.VarName78 = cell2mat(rawNumericColumns(:, 77));
NegHitsRawData.VarName79 = cell2mat(rawNumericColumns(:, 78));
NegHitsRawData.VarName80 = cell2mat(rawNumericColumns(:, 79));
NegHitsRawData.VarName81 = cell2mat(rawNumericColumns(:, 80));
NegHitsRawData.VarName82 = cell2mat(rawNumericColumns(:, 81));
NegHitsRawData.VarName83 = cell2mat(rawNumericColumns(:, 82));
NegHitsRawData.VarName84 = cell2mat(rawNumericColumns(:, 83));
NegHitsRawData.VarName85 = cell2mat(rawNumericColumns(:, 84));
NegHitsRawData.VarName86 = cell2mat(rawNumericColumns(:, 85));
NegHitsRawData.VarName87 = cell2mat(rawNumericColumns(:, 86));
NegHitsRawData.VarName88 = cell2mat(rawNumericColumns(:, 87));
NegHitsRawData.VarName89 = cell2mat(rawNumericColumns(:, 88));
NegHitsRawData.VarName90 = cell2mat(rawNumericColumns(:, 89));
NegHitsRawData.VarName91 = cell2mat(rawNumericColumns(:, 90));
NegHitsRawData.VarName92 = cell2mat(rawNumericColumns(:, 91));
NegHitsRawData.VarName93 = cell2mat(rawNumericColumns(:, 92));
NegHitsRawData.VarName94 = cell2mat(rawNumericColumns(:, 93));
NegHitsRawData.VarName95 = cell2mat(rawNumericColumns(:, 94));
NegHitsRawData.VarName96 = cell2mat(rawNumericColumns(:, 95));
NegHitsRawData.VarName97 = cell2mat(rawNumericColumns(:, 96));
NegHitsRawData.VarName98 = cell2mat(rawNumericColumns(:, 97));
NegHitsRawData.VarName99 = cell2mat(rawNumericColumns(:, 98));
NegHitsRawData.VarName100 = cell2mat(rawNumericColumns(:, 99));
NegHitsRawData.VarName101 = cell2mat(rawNumericColumns(:, 100));
NegHitsRawData.VarName102 = cell2mat(rawNumericColumns(:, 101));
NegHitsRawData.VarName103 = cell2mat(rawNumericColumns(:, 102));
NegHitsRawData.VarName104 = cell2mat(rawNumericColumns(:, 103));
NegHitsRawData.VarName105 = cell2mat(rawNumericColumns(:, 104));
NegHitsRawData.VarName106 = cell2mat(rawNumericColumns(:, 105));
NegHitsRawData.VarName107 = cell2mat(rawNumericColumns(:, 106));
NegHitsRawData.VarName108 = cell2mat(rawNumericColumns(:, 107));
NegHitsRawData.VarName109 = cell2mat(rawNumericColumns(:, 108));
NegHitsRawData.VarName110 = cell2mat(rawNumericColumns(:, 109));
NegHitsRawData.VarName111 = cell2mat(rawNumericColumns(:, 110));
NegHitsRawData.VarName112 = cell2mat(rawNumericColumns(:, 111));
NegHitsRawData.VarName113 = cell2mat(rawNumericColumns(:, 112));
NegHitsRawData.VarName114 = cell2mat(rawNumericColumns(:, 113));
NegHitsRawData.VarName115 = cell2mat(rawNumericColumns(:, 114));
NegHitsRawData.VarName116 = cell2mat(rawNumericColumns(:, 115));
NegHitsRawData.VarName117 = cell2mat(rawNumericColumns(:, 116));
NegHitsRawData.VarName118 = cell2mat(rawNumericColumns(:, 117));
NegHitsRawData.VarName119 = cell2mat(rawNumericColumns(:, 118));
NegHitsRawData.VarName120 = cell2mat(rawNumericColumns(:, 119));
NegHitsRawData.VarName121 = cell2mat(rawNumericColumns(:, 120));
NegHitsRawData.VarName122 = cell2mat(rawNumericColumns(:, 121));
NegHitsRawData.VarName123 = cell2mat(rawNumericColumns(:, 122));
NegHitsRawData.VarName124 = cell2mat(rawNumericColumns(:, 123));
NegHitsRawData.VarName125 = cell2mat(rawNumericColumns(:, 124));
NegHitsRawData.VarName126 = cell2mat(rawNumericColumns(:, 125));
NegHitsRawData.VarName127 = cell2mat(rawNumericColumns(:, 126));
NegHitsRawData.VarName128 = cell2mat(rawNumericColumns(:, 127));
NegHitsRawData.VarName129 = cell2mat(rawNumericColumns(:, 128));
NegHitsRawData.VarName130 = cell2mat(rawNumericColumns(:, 129));
NegHitsRawData.VarName131 = cell2mat(rawNumericColumns(:, 130));
NegHitsRawData.VarName132 = cell2mat(rawNumericColumns(:, 131));
NegHitsRawData.VarName133 = cell2mat(rawNumericColumns(:, 132));
NegHitsRawData.VarName134 = cell2mat(rawNumericColumns(:, 133));
NegHitsRawData.VarName135 = cell2mat(rawNumericColumns(:, 134));
NegHitsRawData.VarName136 = cell2mat(rawNumericColumns(:, 135));
NegHitsRawData.VarName137 = cell2mat(rawNumericColumns(:, 136));
NegHitsRawData.VarName138 = cell2mat(rawNumericColumns(:, 137));
NegHitsRawData.VarName139 = cell2mat(rawNumericColumns(:, 138));
NegHitsRawData.VarName140 = cell2mat(rawNumericColumns(:, 139));
NegHitsRawData.VarName141 = cell2mat(rawNumericColumns(:, 140));
NegHitsRawData.VarName142 = cell2mat(rawNumericColumns(:, 141));
NegHitsRawData.VarName143 = cell2mat(rawNumericColumns(:, 142));
NegHitsRawData.VarName144 = cell2mat(rawNumericColumns(:, 143));
NegHitsRawData.VarName145 = cell2mat(rawNumericColumns(:, 144));
NegHitsRawData.VarName146 = cell2mat(rawNumericColumns(:, 145));
NegHitsRawData.VarName147 = cell2mat(rawNumericColumns(:, 146));
NegHitsRawData.VarName148 = cell2mat(rawNumericColumns(:, 147));
NegHitsRawData.VarName149 = cell2mat(rawNumericColumns(:, 148));
NegHitsRawData.VarName150 = cell2mat(rawNumericColumns(:, 149));
NegHitsRawData.VarName151 = cell2mat(rawNumericColumns(:, 150));
NegHitsRawData.VarName152 = cell2mat(rawNumericColumns(:, 151));
NegHitsRawData.VarName153 = cell2mat(rawNumericColumns(:, 152));
NegHitsRawData.VarName154 = cell2mat(rawNumericColumns(:, 153));
NegHitsRawData.VarName155 = cell2mat(rawNumericColumns(:, 154));
NegHitsRawData.VarName156 = cell2mat(rawNumericColumns(:, 155));
NegHitsRawData.VarName157 = cell2mat(rawNumericColumns(:, 156));
NegHitsRawData.VarName158 = cell2mat(rawNumericColumns(:, 157));
NegHitsRawData.VarName159 = cell2mat(rawNumericColumns(:, 158));
NegHitsRawData.VarName160 = cell2mat(rawNumericColumns(:, 159));
NegHitsRawData.VarName161 = cell2mat(rawNumericColumns(:, 160));
NegHitsRawData.VarName162 = cell2mat(rawNumericColumns(:, 161));
NegHitsRawData.VarName163 = cell2mat(rawNumericColumns(:, 162));
NegHitsRawData.VarName164 = cell2mat(rawNumericColumns(:, 163));
NegHitsRawData.VarName165 = cell2mat(rawNumericColumns(:, 164));
NegHitsRawData.VarName166 = cell2mat(rawNumericColumns(:, 165));
NegHitsRawData.VarName167 = cell2mat(rawNumericColumns(:, 166));
NegHitsRawData.VarName168 = cell2mat(rawNumericColumns(:, 167));
NegHitsRawData.VarName169 = cell2mat(rawNumericColumns(:, 168));
NegHitsRawData.VarName170 = cell2mat(rawNumericColumns(:, 169));
NegHitsRawData.VarName171 = cell2mat(rawNumericColumns(:, 170));
NegHitsRawData.VarName172 = cell2mat(rawNumericColumns(:, 171));
NegHitsRawData.VarName173 = cell2mat(rawNumericColumns(:, 172));
NegHitsRawData.VarName174 = cell2mat(rawNumericColumns(:, 173));
NegHitsRawData.VarName175 = cell2mat(rawNumericColumns(:, 174));
NegHitsRawData.VarName176 = cell2mat(rawNumericColumns(:, 175));
NegHitsRawData.VarName177 = cell2mat(rawNumericColumns(:, 176));
NegHitsRawData.VarName178 = cell2mat(rawNumericColumns(:, 177));
NegHitsRawData.VarName179 = cell2mat(rawNumericColumns(:, 178));
NegHitsRawData.VarName180 = cell2mat(rawNumericColumns(:, 179));
NegHitsRawData.VarName181 = cell2mat(rawNumericColumns(:, 180));
NegHitsRawData.VarName182 = cell2mat(rawNumericColumns(:, 181));
NegHitsRawData.VarName183 = cell2mat(rawNumericColumns(:, 182));
NegHitsRawData.VarName184 = cell2mat(rawNumericColumns(:, 183));
NegHitsRawData.VarName185 = cell2mat(rawNumericColumns(:, 184));
NegHitsRawData.VarName186 = cell2mat(rawNumericColumns(:, 185));
NegHitsRawData.VarName187 = cell2mat(rawNumericColumns(:, 186));
NegHitsRawData.VarName188 = cell2mat(rawNumericColumns(:, 187));
NegHitsRawData.VarName189 = cell2mat(rawNumericColumns(:, 188));
NegHitsRawData.VarName190 = cell2mat(rawNumericColumns(:, 189));
NegHitsRawData.VarName191 = cell2mat(rawNumericColumns(:, 190));
NegHitsRawData.VarName192 = cell2mat(rawNumericColumns(:, 191));
NegHitsRawData.VarName193 = cell2mat(rawNumericColumns(:, 192));
NegHitsRawData.VarName194 = cell2mat(rawNumericColumns(:, 193));
NegHitsRawData.VarName195 = cell2mat(rawNumericColumns(:, 194));
NegHitsRawData.VarName196 = cell2mat(rawNumericColumns(:, 195));
NegHitsRawData.VarName197 = cell2mat(rawNumericColumns(:, 196));
NegHitsRawData.VarName198 = cell2mat(rawNumericColumns(:, 197));
NegHitsRawData.VarName199 = cell2mat(rawNumericColumns(:, 198));
NegHitsRawData.VarName200 = cell2mat(rawNumericColumns(:, 199));
NegHitsRawData.VarName201 = cell2mat(rawNumericColumns(:, 200));
NegHitsRawData.VarName202 = cell2mat(rawNumericColumns(:, 201));
NegHitsRawData.VarName203 = cell2mat(rawNumericColumns(:, 202));
NegHitsRawData.VarName204 = cell2mat(rawNumericColumns(:, 203));
NegHitsRawData.VarName205 = cell2mat(rawNumericColumns(:, 204));
NegHitsRawData.VarName206 = cell2mat(rawNumericColumns(:, 205));
NegHitsRawData.VarName207 = cell2mat(rawNumericColumns(:, 206));
NegHitsRawData.VarName208 = cell2mat(rawNumericColumns(:, 207));
NegHitsRawData.VarName209 = cell2mat(rawNumericColumns(:, 208));
NegHitsRawData.VarName210 = cell2mat(rawNumericColumns(:, 209));
NegHitsRawData.VarName211 = cell2mat(rawNumericColumns(:, 210));
NegHitsRawData.VarName212 = cell2mat(rawNumericColumns(:, 211));
NegHitsRawData.VarName213 = cell2mat(rawNumericColumns(:, 212));
NegHitsRawData.VarName214 = cell2mat(rawNumericColumns(:, 213));
NegHitsRawData.VarName215 = cell2mat(rawNumericColumns(:, 214));
NegHitsRawData.VarName216 = cell2mat(rawNumericColumns(:, 215));
NegHitsRawData.VarName217 = cell2mat(rawNumericColumns(:, 216));
NegHitsRawData.VarName218 = cell2mat(rawNumericColumns(:, 217));
NegHitsRawData.VarName219 = cell2mat(rawNumericColumns(:, 218));
NegHitsRawData.VarName220 = cell2mat(rawNumericColumns(:, 219));
NegHitsRawData.VarName221 = cell2mat(rawNumericColumns(:, 220));
NegHitsRawData.VarName222 = cell2mat(rawNumericColumns(:, 221));
NegHitsRawData.VarName223 = cell2mat(rawNumericColumns(:, 222));
NegHitsRawData.VarName224 = cell2mat(rawNumericColumns(:, 223));
NegHitsRawData.VarName225 = cell2mat(rawNumericColumns(:, 224));
NegHitsRawData.VarName226 = cell2mat(rawNumericColumns(:, 225));
NegHitsRawData.VarName227 = cell2mat(rawNumericColumns(:, 226));
NegHitsRawData.VarName228 = cell2mat(rawNumericColumns(:, 227));
NegHitsRawData.VarName229 = cell2mat(rawNumericColumns(:, 228));
NegHitsRawData.VarName230 = cell2mat(rawNumericColumns(:, 229));
NegHitsRawData.VarName231 = cell2mat(rawNumericColumns(:, 230));
NegHitsRawData.VarName232 = cell2mat(rawNumericColumns(:, 231));
NegHitsRawData.VarName233 = cell2mat(rawNumericColumns(:, 232));
NegHitsRawData.VarName234 = cell2mat(rawNumericColumns(:, 233));
NegHitsRawData.VarName235 = cell2mat(rawNumericColumns(:, 234));
NegHitsRawData.VarName236 = cell2mat(rawNumericColumns(:, 235));
NegHitsRawData.VarName237 = cell2mat(rawNumericColumns(:, 236));
NegHitsRawData.VarName238 = cell2mat(rawNumericColumns(:, 237));
NegHitsRawData.VarName239 = cell2mat(rawNumericColumns(:, 238));
NegHitsRawData.VarName240 = cell2mat(rawNumericColumns(:, 239));
NegHitsRawData.VarName241 = cell2mat(rawNumericColumns(:, 240));
NegHitsRawData.VarName242 = cell2mat(rawNumericColumns(:, 241));
NegHitsRawData.VarName243 = cell2mat(rawNumericColumns(:, 242));
NegHitsRawData.VarName244 = cell2mat(rawNumericColumns(:, 243));
NegHitsRawData.VarName245 = cell2mat(rawNumericColumns(:, 244));
NegHitsRawData.VarName246 = cell2mat(rawNumericColumns(:, 245));
NegHitsRawData.VarName247 = cell2mat(rawNumericColumns(:, 246));
NegHitsRawData.VarName248 = cell2mat(rawNumericColumns(:, 247));
NegHitsRawData.VarName249 = cell2mat(rawNumericColumns(:, 248));
NegHitsRawData.VarName250 = cell2mat(rawNumericColumns(:, 249));
NegHitsRawData.VarName251 = cell2mat(rawNumericColumns(:, 250));
NegHitsRawData.VarName252 = cell2mat(rawNumericColumns(:, 251));
NegHitsRawData.VarName253 = cell2mat(rawNumericColumns(:, 252));
NegHitsRawData.VarName254 = cell2mat(rawNumericColumns(:, 253));
NegHitsRawData.VarName255 = cell2mat(rawNumericColumns(:, 254));
NegHitsRawData.VarName256 = cell2mat(rawNumericColumns(:, 255));
NegHitsRawData.VarName257 = cell2mat(rawNumericColumns(:, 256));
NegHitsRawData.VarName258 = cell2mat(rawNumericColumns(:, 257));
NegHitsRawData.VarName259 = cell2mat(rawNumericColumns(:, 258));
NegHitsRawData.VarName260 = cell2mat(rawNumericColumns(:, 259));
NegHitsRawData.VarName261 = cell2mat(rawNumericColumns(:, 260));
NegHitsRawData.VarName262 = cell2mat(rawNumericColumns(:, 261));
NegHitsRawData.VarName263 = cell2mat(rawNumericColumns(:, 262));
NegHitsRawData.VarName264 = cell2mat(rawNumericColumns(:, 263));
NegHitsRawData.VarName265 = cell2mat(rawNumericColumns(:, 264));
NegHitsRawData.VarName266 = cell2mat(rawNumericColumns(:, 265));
NegHitsRawData.VarName267 = cell2mat(rawNumericColumns(:, 266));
NegHitsRawData.VarName268 = cell2mat(rawNumericColumns(:, 267));
NegHitsRawData.VarName269 = cell2mat(rawNumericColumns(:, 268));
NegHitsRawData.VarName270 = cell2mat(rawNumericColumns(:, 269));
NegHitsRawData.VarName271 = cell2mat(rawNumericColumns(:, 270));
NegHitsRawData.VarName272 = cell2mat(rawNumericColumns(:, 271));
NegHitsRawData.VarName273 = cell2mat(rawNumericColumns(:, 272));
NegHitsRawData.VarName274 = cell2mat(rawNumericColumns(:, 273));
NegHitsRawData.VarName275 = cell2mat(rawNumericColumns(:, 274));
NegHitsRawData.VarName276 = cell2mat(rawNumericColumns(:, 275));
NegHitsRawData.VarName277 = cell2mat(rawNumericColumns(:, 276));
NegHitsRawData.VarName278 = cell2mat(rawNumericColumns(:, 277));
NegHitsRawData.VarName279 = cell2mat(rawNumericColumns(:, 278));
NegHitsRawData.VarName280 = cell2mat(rawNumericColumns(:, 279));
NegHitsRawData.VarName281 = cell2mat(rawNumericColumns(:, 280));
NegHitsRawData.VarName282 = cell2mat(rawNumericColumns(:, 281));
NegHitsRawData.VarName283 = cell2mat(rawNumericColumns(:, 282));
NegHitsRawData.VarName284 = cell2mat(rawNumericColumns(:, 283));
NegHitsRawData.VarName285 = cell2mat(rawNumericColumns(:, 284));
NegHitsRawData.VarName286 = cell2mat(rawNumericColumns(:, 285));
NegHitsRawData.VarName287 = cell2mat(rawNumericColumns(:, 286));
NegHitsRawData.VarName288 = cell2mat(rawNumericColumns(:, 287));
NegHitsRawData.VarName289 = cell2mat(rawNumericColumns(:, 288));
NegHitsRawData.VarName290 = cell2mat(rawNumericColumns(:, 289));
NegHitsRawData.VarName291 = cell2mat(rawNumericColumns(:, 290));
NegHitsRawData.VarName292 = cell2mat(rawNumericColumns(:, 291));
NegHitsRawData.VarName293 = cell2mat(rawNumericColumns(:, 292));
NegHitsRawData.VarName294 = cell2mat(rawNumericColumns(:, 293));
NegHitsRawData.VarName295 = cell2mat(rawNumericColumns(:, 294));
NegHitsRawData.VarName296 = cell2mat(rawNumericColumns(:, 295));
NegHitsRawData.VarName297 = cell2mat(rawNumericColumns(:, 296));
NegHitsRawData.VarName298 = cell2mat(rawNumericColumns(:, 297));
NegHitsRawData.VarName299 = cell2mat(rawNumericColumns(:, 298));
NegHitsRawData.VarName300 = cell2mat(rawNumericColumns(:, 299));
NegHitsRawData.VarName301 = cell2mat(rawNumericColumns(:, 300));
NegHitsRawData.VarName302 = cell2mat(rawNumericColumns(:, 301));
NegHitsRawData.VarName303 = cell2mat(rawNumericColumns(:, 302));
NegHitsRawData.VarName304 = cell2mat(rawNumericColumns(:, 303));
NegHitsRawData.VarName305 = cell2mat(rawNumericColumns(:, 304));
NegHitsRawData.VarName306 = cell2mat(rawNumericColumns(:, 305));
NegHitsRawData.VarName307 = cell2mat(rawNumericColumns(:, 306));
NegHitsRawData.VarName308 = cell2mat(rawNumericColumns(:, 307));
NegHitsRawData.VarName309 = cell2mat(rawNumericColumns(:, 308));
NegHitsRawData.VarName310 = cell2mat(rawNumericColumns(:, 309));
NegHitsRawData.VarName311 = cell2mat(rawNumericColumns(:, 310));
NegHitsRawData.VarName312 = cell2mat(rawNumericColumns(:, 311));
NegHitsRawData.VarName313 = cell2mat(rawNumericColumns(:, 312));
NegHitsRawData.VarName314 = cell2mat(rawNumericColumns(:, 313));
NegHitsRawData.VarName315 = cell2mat(rawNumericColumns(:, 314));
NegHitsRawData.VarName316 = cell2mat(rawNumericColumns(:, 315));
NegHitsRawData.VarName317 = cell2mat(rawNumericColumns(:, 316));
NegHitsRawData.VarName318 = cell2mat(rawNumericColumns(:, 317));
NegHitsRawData.VarName319 = cell2mat(rawNumericColumns(:, 318));
NegHitsRawData.VarName320 = cell2mat(rawNumericColumns(:, 319));
NegHitsRawData.VarName321 = cell2mat(rawNumericColumns(:, 320));
NegHitsRawData.VarName322 = cell2mat(rawNumericColumns(:, 321));
NegHitsRawData.VarName323 = cell2mat(rawNumericColumns(:, 322));
NegHitsRawData.VarName324 = cell2mat(rawNumericColumns(:, 323));
NegHitsRawData.VarName325 = cell2mat(rawNumericColumns(:, 324));
NegHitsRawData.VarName326 = cell2mat(rawNumericColumns(:, 325));

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

%%
T = NegHitsRawData; %NEG condition first
Electrodes = T.Fp1;
data_neg = T(:,2:326);
data_neg = data_neg{:,:};
meanNeg_electrodes = mean(data_neg);

Fp1 = data_neg(1,:);
Fz = data_neg(2,:);
F3 = data_neg(3,:);
F7 = data_neg(4,:);
FT9 = data_neg(5,:);
FC5 = data_neg(6,:);
FC1 = data_neg(7,:);
C3 = data_neg(8,:);
T7 = data_neg(9,:);
CP5 = data_neg(10,:);
CP1 = data_neg(11,:);
Pz = data_neg(12,:);
P3 = data_neg(13,:);
P7 = data_neg(14,:);
O1 = data_neg(15,:);
Oz = data_neg(16,:);
O2 = data_neg(17,:);
P4 = data_neg(18,:);
P8 = data_neg(19,:);
CP6 = data_neg(20,:);
CP2 = data_neg(21,:);
C4 = data_neg(22,:);
T8 = data_neg(23,:);
FT10 = data_neg(24,:);
FC6 = data_neg(25,:);
FC2 = data_neg(26,:);
F4 = data_neg(27,:);
F8 = data_neg(28,:);
Fp2 = data_neg(29,:);
AFz = data_neg(30,:);


 Cz =[CP1; CP2];
Cz = mean(Cz);

F3_neg = F3 
Fz_neg = Fz
F4_neg = F4
C3_neg = C3
Cz_neg = Cz
C4_neg = C4
P3_neg = P3
Pz_neg = Pz
P4_neg = P4

data_selectedElectrodes_neg = [F3; F7; FC1; C3; T7; CP5; CP1; P3; P7; P4; P8; CP6; CP2; C4; T8; FC2; F4; F8;];

%OR
%
%ROIs
dataROIparietal_neg = [P3; CP1]
dataROIfrontal_neg = [Fp1; Fp2; F7; F3; Fz; AFz; F4; F8]
dataROIN170_neg = [T8; T7; C3; C4]
%%
%% Initialize variables.
filename = 'C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\Neu_Hits_Raw Data.txt';
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
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


%% Split data into numeric and string columns.
rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326]);
rawStringColumns = string(raw(:, 1));


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
NeuHitsRawData = table;
NeuHitsRawData.Fp1 = rawStringColumns(:, 1);
NeuHitsRawData.VarName2 = cell2mat(rawNumericColumns(:, 1));
NeuHitsRawData.VarName3 = cell2mat(rawNumericColumns(:, 2));
NeuHitsRawData.VarName4 = cell2mat(rawNumericColumns(:, 3));
NeuHitsRawData.VarName5 = cell2mat(rawNumericColumns(:, 4));
NeuHitsRawData.VarName6 = cell2mat(rawNumericColumns(:, 5));
NeuHitsRawData.VarName7 = cell2mat(rawNumericColumns(:, 6));
NeuHitsRawData.VarName8 = cell2mat(rawNumericColumns(:, 7));
NeuHitsRawData.VarName9 = cell2mat(rawNumericColumns(:, 8));
NeuHitsRawData.VarName10 = cell2mat(rawNumericColumns(:, 9));
NeuHitsRawData.VarName11 = cell2mat(rawNumericColumns(:, 10));
NeuHitsRawData.VarName12 = cell2mat(rawNumericColumns(:, 11));
NeuHitsRawData.VarName13 = cell2mat(rawNumericColumns(:, 12));
NeuHitsRawData.VarName14 = cell2mat(rawNumericColumns(:, 13));
NeuHitsRawData.VarName15 = cell2mat(rawNumericColumns(:, 14));
NeuHitsRawData.VarName16 = cell2mat(rawNumericColumns(:, 15));
NeuHitsRawData.VarName17 = cell2mat(rawNumericColumns(:, 16));
NeuHitsRawData.VarName18 = cell2mat(rawNumericColumns(:, 17));
NeuHitsRawData.VarName19 = cell2mat(rawNumericColumns(:, 18));
NeuHitsRawData.VarName20 = cell2mat(rawNumericColumns(:, 19));
NeuHitsRawData.VarName21 = cell2mat(rawNumericColumns(:, 20));
NeuHitsRawData.VarName22 = cell2mat(rawNumericColumns(:, 21));
NeuHitsRawData.VarName23 = cell2mat(rawNumericColumns(:, 22));
NeuHitsRawData.VarName24 = cell2mat(rawNumericColumns(:, 23));
NeuHitsRawData.VarName25 = cell2mat(rawNumericColumns(:, 24));
NeuHitsRawData.VarName26 = cell2mat(rawNumericColumns(:, 25));
NeuHitsRawData.VarName27 = cell2mat(rawNumericColumns(:, 26));
NeuHitsRawData.VarName28 = cell2mat(rawNumericColumns(:, 27));
NeuHitsRawData.VarName29 = cell2mat(rawNumericColumns(:, 28));
NeuHitsRawData.VarName30 = cell2mat(rawNumericColumns(:, 29));
NeuHitsRawData.VarName31 = cell2mat(rawNumericColumns(:, 30));
NeuHitsRawData.VarName32 = cell2mat(rawNumericColumns(:, 31));
NeuHitsRawData.VarName33 = cell2mat(rawNumericColumns(:, 32));
NeuHitsRawData.VarName34 = cell2mat(rawNumericColumns(:, 33));
NeuHitsRawData.VarName35 = cell2mat(rawNumericColumns(:, 34));
NeuHitsRawData.VarName36 = cell2mat(rawNumericColumns(:, 35));
NeuHitsRawData.VarName37 = cell2mat(rawNumericColumns(:, 36));
NeuHitsRawData.VarName38 = cell2mat(rawNumericColumns(:, 37));
NeuHitsRawData.VarName39 = cell2mat(rawNumericColumns(:, 38));
NeuHitsRawData.VarName40 = cell2mat(rawNumericColumns(:, 39));
NeuHitsRawData.VarName41 = cell2mat(rawNumericColumns(:, 40));
NeuHitsRawData.VarName42 = cell2mat(rawNumericColumns(:, 41));
NeuHitsRawData.VarName43 = cell2mat(rawNumericColumns(:, 42));
NeuHitsRawData.VarName44 = cell2mat(rawNumericColumns(:, 43));
NeuHitsRawData.VarName45 = cell2mat(rawNumericColumns(:, 44));
NeuHitsRawData.VarName46 = cell2mat(rawNumericColumns(:, 45));
NeuHitsRawData.VarName47 = cell2mat(rawNumericColumns(:, 46));
NeuHitsRawData.VarName48 = cell2mat(rawNumericColumns(:, 47));
NeuHitsRawData.VarName49 = cell2mat(rawNumericColumns(:, 48));
NeuHitsRawData.VarName50 = cell2mat(rawNumericColumns(:, 49));
NeuHitsRawData.VarName51 = cell2mat(rawNumericColumns(:, 50));
NeuHitsRawData.VarName52 = cell2mat(rawNumericColumns(:, 51));
NeuHitsRawData.VarName53 = cell2mat(rawNumericColumns(:, 52));
NeuHitsRawData.VarName54 = cell2mat(rawNumericColumns(:, 53));
NeuHitsRawData.VarName55 = cell2mat(rawNumericColumns(:, 54));
NeuHitsRawData.VarName56 = cell2mat(rawNumericColumns(:, 55));
NeuHitsRawData.VarName57 = cell2mat(rawNumericColumns(:, 56));
NeuHitsRawData.VarName58 = cell2mat(rawNumericColumns(:, 57));
NeuHitsRawData.VarName59 = cell2mat(rawNumericColumns(:, 58));
NeuHitsRawData.VarName60 = cell2mat(rawNumericColumns(:, 59));
NeuHitsRawData.VarName61 = cell2mat(rawNumericColumns(:, 60));
NeuHitsRawData.VarName62 = cell2mat(rawNumericColumns(:, 61));
NeuHitsRawData.VarName63 = cell2mat(rawNumericColumns(:, 62));
NeuHitsRawData.VarName64 = cell2mat(rawNumericColumns(:, 63));
NeuHitsRawData.VarName65 = cell2mat(rawNumericColumns(:, 64));
NeuHitsRawData.VarName66 = cell2mat(rawNumericColumns(:, 65));
NeuHitsRawData.VarName67 = cell2mat(rawNumericColumns(:, 66));
NeuHitsRawData.VarName68 = cell2mat(rawNumericColumns(:, 67));
NeuHitsRawData.VarName69 = cell2mat(rawNumericColumns(:, 68));
NeuHitsRawData.VarName70 = cell2mat(rawNumericColumns(:, 69));
NeuHitsRawData.VarName71 = cell2mat(rawNumericColumns(:, 70));
NeuHitsRawData.VarName72 = cell2mat(rawNumericColumns(:, 71));
NeuHitsRawData.VarName73 = cell2mat(rawNumericColumns(:, 72));
NeuHitsRawData.VarName74 = cell2mat(rawNumericColumns(:, 73));
NeuHitsRawData.VarName75 = cell2mat(rawNumericColumns(:, 74));
NeuHitsRawData.VarName76 = cell2mat(rawNumericColumns(:, 75));
NeuHitsRawData.VarName77 = cell2mat(rawNumericColumns(:, 76));
NeuHitsRawData.VarName78 = cell2mat(rawNumericColumns(:, 77));
NeuHitsRawData.VarName79 = cell2mat(rawNumericColumns(:, 78));
NeuHitsRawData.VarName80 = cell2mat(rawNumericColumns(:, 79));
NeuHitsRawData.VarName81 = cell2mat(rawNumericColumns(:, 80));
NeuHitsRawData.VarName82 = cell2mat(rawNumericColumns(:, 81));
NeuHitsRawData.VarName83 = cell2mat(rawNumericColumns(:, 82));
NeuHitsRawData.VarName84 = cell2mat(rawNumericColumns(:, 83));
NeuHitsRawData.VarName85 = cell2mat(rawNumericColumns(:, 84));
NeuHitsRawData.VarName86 = cell2mat(rawNumericColumns(:, 85));
NeuHitsRawData.VarName87 = cell2mat(rawNumericColumns(:, 86));
NeuHitsRawData.VarName88 = cell2mat(rawNumericColumns(:, 87));
NeuHitsRawData.VarName89 = cell2mat(rawNumericColumns(:, 88));
NeuHitsRawData.VarName90 = cell2mat(rawNumericColumns(:, 89));
NeuHitsRawData.VarName91 = cell2mat(rawNumericColumns(:, 90));
NeuHitsRawData.VarName92 = cell2mat(rawNumericColumns(:, 91));
NeuHitsRawData.VarName93 = cell2mat(rawNumericColumns(:, 92));
NeuHitsRawData.VarName94 = cell2mat(rawNumericColumns(:, 93));
NeuHitsRawData.VarName95 = cell2mat(rawNumericColumns(:, 94));
NeuHitsRawData.VarName96 = cell2mat(rawNumericColumns(:, 95));
NeuHitsRawData.VarName97 = cell2mat(rawNumericColumns(:, 96));
NeuHitsRawData.VarName98 = cell2mat(rawNumericColumns(:, 97));
NeuHitsRawData.VarName99 = cell2mat(rawNumericColumns(:, 98));
NeuHitsRawData.VarName100 = cell2mat(rawNumericColumns(:, 99));
NeuHitsRawData.VarName101 = cell2mat(rawNumericColumns(:, 100));
NeuHitsRawData.VarName102 = cell2mat(rawNumericColumns(:, 101));
NeuHitsRawData.VarName103 = cell2mat(rawNumericColumns(:, 102));
NeuHitsRawData.VarName104 = cell2mat(rawNumericColumns(:, 103));
NeuHitsRawData.VarName105 = cell2mat(rawNumericColumns(:, 104));
NeuHitsRawData.VarName106 = cell2mat(rawNumericColumns(:, 105));
NeuHitsRawData.VarName107 = cell2mat(rawNumericColumns(:, 106));
NeuHitsRawData.VarName108 = cell2mat(rawNumericColumns(:, 107));
NeuHitsRawData.VarName109 = cell2mat(rawNumericColumns(:, 108));
NeuHitsRawData.VarName110 = cell2mat(rawNumericColumns(:, 109));
NeuHitsRawData.VarName111 = cell2mat(rawNumericColumns(:, 110));
NeuHitsRawData.VarName112 = cell2mat(rawNumericColumns(:, 111));
NeuHitsRawData.VarName113 = cell2mat(rawNumericColumns(:, 112));
NeuHitsRawData.VarName114 = cell2mat(rawNumericColumns(:, 113));
NeuHitsRawData.VarName115 = cell2mat(rawNumericColumns(:, 114));
NeuHitsRawData.VarName116 = cell2mat(rawNumericColumns(:, 115));
NeuHitsRawData.VarName117 = cell2mat(rawNumericColumns(:, 116));
NeuHitsRawData.VarName118 = cell2mat(rawNumericColumns(:, 117));
NeuHitsRawData.VarName119 = cell2mat(rawNumericColumns(:, 118));
NeuHitsRawData.VarName120 = cell2mat(rawNumericColumns(:, 119));
NeuHitsRawData.VarName121 = cell2mat(rawNumericColumns(:, 120));
NeuHitsRawData.VarName122 = cell2mat(rawNumericColumns(:, 121));
NeuHitsRawData.VarName123 = cell2mat(rawNumericColumns(:, 122));
NeuHitsRawData.VarName124 = cell2mat(rawNumericColumns(:, 123));
NeuHitsRawData.VarName125 = cell2mat(rawNumericColumns(:, 124));
NeuHitsRawData.VarName126 = cell2mat(rawNumericColumns(:, 125));
NeuHitsRawData.VarName127 = cell2mat(rawNumericColumns(:, 126));
NeuHitsRawData.VarName128 = cell2mat(rawNumericColumns(:, 127));
NeuHitsRawData.VarName129 = cell2mat(rawNumericColumns(:, 128));
NeuHitsRawData.VarName130 = cell2mat(rawNumericColumns(:, 129));
NeuHitsRawData.VarName131 = cell2mat(rawNumericColumns(:, 130));
NeuHitsRawData.VarName132 = cell2mat(rawNumericColumns(:, 131));
NeuHitsRawData.VarName133 = cell2mat(rawNumericColumns(:, 132));
NeuHitsRawData.VarName134 = cell2mat(rawNumericColumns(:, 133));
NeuHitsRawData.VarName135 = cell2mat(rawNumericColumns(:, 134));
NeuHitsRawData.VarName136 = cell2mat(rawNumericColumns(:, 135));
NeuHitsRawData.VarName137 = cell2mat(rawNumericColumns(:, 136));
NeuHitsRawData.VarName138 = cell2mat(rawNumericColumns(:, 137));
NeuHitsRawData.VarName139 = cell2mat(rawNumericColumns(:, 138));
NeuHitsRawData.VarName140 = cell2mat(rawNumericColumns(:, 139));
NeuHitsRawData.VarName141 = cell2mat(rawNumericColumns(:, 140));
NeuHitsRawData.VarName142 = cell2mat(rawNumericColumns(:, 141));
NeuHitsRawData.VarName143 = cell2mat(rawNumericColumns(:, 142));
NeuHitsRawData.VarName144 = cell2mat(rawNumericColumns(:, 143));
NeuHitsRawData.VarName145 = cell2mat(rawNumericColumns(:, 144));
NeuHitsRawData.VarName146 = cell2mat(rawNumericColumns(:, 145));
NeuHitsRawData.VarName147 = cell2mat(rawNumericColumns(:, 146));
NeuHitsRawData.VarName148 = cell2mat(rawNumericColumns(:, 147));
NeuHitsRawData.VarName149 = cell2mat(rawNumericColumns(:, 148));
NeuHitsRawData.VarName150 = cell2mat(rawNumericColumns(:, 149));
NeuHitsRawData.VarName151 = cell2mat(rawNumericColumns(:, 150));
NeuHitsRawData.VarName152 = cell2mat(rawNumericColumns(:, 151));
NeuHitsRawData.VarName153 = cell2mat(rawNumericColumns(:, 152));
NeuHitsRawData.VarName154 = cell2mat(rawNumericColumns(:, 153));
NeuHitsRawData.VarName155 = cell2mat(rawNumericColumns(:, 154));
NeuHitsRawData.VarName156 = cell2mat(rawNumericColumns(:, 155));
NeuHitsRawData.VarName157 = cell2mat(rawNumericColumns(:, 156));
NeuHitsRawData.VarName158 = cell2mat(rawNumericColumns(:, 157));
NeuHitsRawData.VarName159 = cell2mat(rawNumericColumns(:, 158));
NeuHitsRawData.VarName160 = cell2mat(rawNumericColumns(:, 159));
NeuHitsRawData.VarName161 = cell2mat(rawNumericColumns(:, 160));
NeuHitsRawData.VarName162 = cell2mat(rawNumericColumns(:, 161));
NeuHitsRawData.VarName163 = cell2mat(rawNumericColumns(:, 162));
NeuHitsRawData.VarName164 = cell2mat(rawNumericColumns(:, 163));
NeuHitsRawData.VarName165 = cell2mat(rawNumericColumns(:, 164));
NeuHitsRawData.VarName166 = cell2mat(rawNumericColumns(:, 165));
NeuHitsRawData.VarName167 = cell2mat(rawNumericColumns(:, 166));
NeuHitsRawData.VarName168 = cell2mat(rawNumericColumns(:, 167));
NeuHitsRawData.VarName169 = cell2mat(rawNumericColumns(:, 168));
NeuHitsRawData.VarName170 = cell2mat(rawNumericColumns(:, 169));
NeuHitsRawData.VarName171 = cell2mat(rawNumericColumns(:, 170));
NeuHitsRawData.VarName172 = cell2mat(rawNumericColumns(:, 171));
NeuHitsRawData.VarName173 = cell2mat(rawNumericColumns(:, 172));
NeuHitsRawData.VarName174 = cell2mat(rawNumericColumns(:, 173));
NeuHitsRawData.VarName175 = cell2mat(rawNumericColumns(:, 174));
NeuHitsRawData.VarName176 = cell2mat(rawNumericColumns(:, 175));
NeuHitsRawData.VarName177 = cell2mat(rawNumericColumns(:, 176));
NeuHitsRawData.VarName178 = cell2mat(rawNumericColumns(:, 177));
NeuHitsRawData.VarName179 = cell2mat(rawNumericColumns(:, 178));
NeuHitsRawData.VarName180 = cell2mat(rawNumericColumns(:, 179));
NeuHitsRawData.VarName181 = cell2mat(rawNumericColumns(:, 180));
NeuHitsRawData.VarName182 = cell2mat(rawNumericColumns(:, 181));
NeuHitsRawData.VarName183 = cell2mat(rawNumericColumns(:, 182));
NeuHitsRawData.VarName184 = cell2mat(rawNumericColumns(:, 183));
NeuHitsRawData.VarName185 = cell2mat(rawNumericColumns(:, 184));
NeuHitsRawData.VarName186 = cell2mat(rawNumericColumns(:, 185));
NeuHitsRawData.VarName187 = cell2mat(rawNumericColumns(:, 186));
NeuHitsRawData.VarName188 = cell2mat(rawNumericColumns(:, 187));
NeuHitsRawData.VarName189 = cell2mat(rawNumericColumns(:, 188));
NeuHitsRawData.VarName190 = cell2mat(rawNumericColumns(:, 189));
NeuHitsRawData.VarName191 = cell2mat(rawNumericColumns(:, 190));
NeuHitsRawData.VarName192 = cell2mat(rawNumericColumns(:, 191));
NeuHitsRawData.VarName193 = cell2mat(rawNumericColumns(:, 192));
NeuHitsRawData.VarName194 = cell2mat(rawNumericColumns(:, 193));
NeuHitsRawData.VarName195 = cell2mat(rawNumericColumns(:, 194));
NeuHitsRawData.VarName196 = cell2mat(rawNumericColumns(:, 195));
NeuHitsRawData.VarName197 = cell2mat(rawNumericColumns(:, 196));
NeuHitsRawData.VarName198 = cell2mat(rawNumericColumns(:, 197));
NeuHitsRawData.VarName199 = cell2mat(rawNumericColumns(:, 198));
NeuHitsRawData.VarName200 = cell2mat(rawNumericColumns(:, 199));
NeuHitsRawData.VarName201 = cell2mat(rawNumericColumns(:, 200));
NeuHitsRawData.VarName202 = cell2mat(rawNumericColumns(:, 201));
NeuHitsRawData.VarName203 = cell2mat(rawNumericColumns(:, 202));
NeuHitsRawData.VarName204 = cell2mat(rawNumericColumns(:, 203));
NeuHitsRawData.VarName205 = cell2mat(rawNumericColumns(:, 204));
NeuHitsRawData.VarName206 = cell2mat(rawNumericColumns(:, 205));
NeuHitsRawData.VarName207 = cell2mat(rawNumericColumns(:, 206));
NeuHitsRawData.VarName208 = cell2mat(rawNumericColumns(:, 207));
NeuHitsRawData.VarName209 = cell2mat(rawNumericColumns(:, 208));
NeuHitsRawData.VarName210 = cell2mat(rawNumericColumns(:, 209));
NeuHitsRawData.VarName211 = cell2mat(rawNumericColumns(:, 210));
NeuHitsRawData.VarName212 = cell2mat(rawNumericColumns(:, 211));
NeuHitsRawData.VarName213 = cell2mat(rawNumericColumns(:, 212));
NeuHitsRawData.VarName214 = cell2mat(rawNumericColumns(:, 213));
NeuHitsRawData.VarName215 = cell2mat(rawNumericColumns(:, 214));
NeuHitsRawData.VarName216 = cell2mat(rawNumericColumns(:, 215));
NeuHitsRawData.VarName217 = cell2mat(rawNumericColumns(:, 216));
NeuHitsRawData.VarName218 = cell2mat(rawNumericColumns(:, 217));
NeuHitsRawData.VarName219 = cell2mat(rawNumericColumns(:, 218));
NeuHitsRawData.VarName220 = cell2mat(rawNumericColumns(:, 219));
NeuHitsRawData.VarName221 = cell2mat(rawNumericColumns(:, 220));
NeuHitsRawData.VarName222 = cell2mat(rawNumericColumns(:, 221));
NeuHitsRawData.VarName223 = cell2mat(rawNumericColumns(:, 222));
NeuHitsRawData.VarName224 = cell2mat(rawNumericColumns(:, 223));
NeuHitsRawData.VarName225 = cell2mat(rawNumericColumns(:, 224));
NeuHitsRawData.VarName226 = cell2mat(rawNumericColumns(:, 225));
NeuHitsRawData.VarName227 = cell2mat(rawNumericColumns(:, 226));
NeuHitsRawData.VarName228 = cell2mat(rawNumericColumns(:, 227));
NeuHitsRawData.VarName229 = cell2mat(rawNumericColumns(:, 228));
NeuHitsRawData.VarName230 = cell2mat(rawNumericColumns(:, 229));
NeuHitsRawData.VarName231 = cell2mat(rawNumericColumns(:, 230));
NeuHitsRawData.VarName232 = cell2mat(rawNumericColumns(:, 231));
NeuHitsRawData.VarName233 = cell2mat(rawNumericColumns(:, 232));
NeuHitsRawData.VarName234 = cell2mat(rawNumericColumns(:, 233));
NeuHitsRawData.VarName235 = cell2mat(rawNumericColumns(:, 234));
NeuHitsRawData.VarName236 = cell2mat(rawNumericColumns(:, 235));
NeuHitsRawData.VarName237 = cell2mat(rawNumericColumns(:, 236));
NeuHitsRawData.VarName238 = cell2mat(rawNumericColumns(:, 237));
NeuHitsRawData.VarName239 = cell2mat(rawNumericColumns(:, 238));
NeuHitsRawData.VarName240 = cell2mat(rawNumericColumns(:, 239));
NeuHitsRawData.VarName241 = cell2mat(rawNumericColumns(:, 240));
NeuHitsRawData.VarName242 = cell2mat(rawNumericColumns(:, 241));
NeuHitsRawData.VarName243 = cell2mat(rawNumericColumns(:, 242));
NeuHitsRawData.VarName244 = cell2mat(rawNumericColumns(:, 243));
NeuHitsRawData.VarName245 = cell2mat(rawNumericColumns(:, 244));
NeuHitsRawData.VarName246 = cell2mat(rawNumericColumns(:, 245));
NeuHitsRawData.VarName247 = cell2mat(rawNumericColumns(:, 246));
NeuHitsRawData.VarName248 = cell2mat(rawNumericColumns(:, 247));
NeuHitsRawData.VarName249 = cell2mat(rawNumericColumns(:, 248));
NeuHitsRawData.VarName250 = cell2mat(rawNumericColumns(:, 249));
NeuHitsRawData.VarName251 = cell2mat(rawNumericColumns(:, 250));
NeuHitsRawData.VarName252 = cell2mat(rawNumericColumns(:, 251));
NeuHitsRawData.VarName253 = cell2mat(rawNumericColumns(:, 252));
NeuHitsRawData.VarName254 = cell2mat(rawNumericColumns(:, 253));
NeuHitsRawData.VarName255 = cell2mat(rawNumericColumns(:, 254));
NeuHitsRawData.VarName256 = cell2mat(rawNumericColumns(:, 255));
NeuHitsRawData.VarName257 = cell2mat(rawNumericColumns(:, 256));
NeuHitsRawData.VarName258 = cell2mat(rawNumericColumns(:, 257));
NeuHitsRawData.VarName259 = cell2mat(rawNumericColumns(:, 258));
NeuHitsRawData.VarName260 = cell2mat(rawNumericColumns(:, 259));
NeuHitsRawData.VarName261 = cell2mat(rawNumericColumns(:, 260));
NeuHitsRawData.VarName262 = cell2mat(rawNumericColumns(:, 261));
NeuHitsRawData.VarName263 = cell2mat(rawNumericColumns(:, 262));
NeuHitsRawData.VarName264 = cell2mat(rawNumericColumns(:, 263));
NeuHitsRawData.VarName265 = cell2mat(rawNumericColumns(:, 264));
NeuHitsRawData.VarName266 = cell2mat(rawNumericColumns(:, 265));
NeuHitsRawData.VarName267 = cell2mat(rawNumericColumns(:, 266));
NeuHitsRawData.VarName268 = cell2mat(rawNumericColumns(:, 267));
NeuHitsRawData.VarName269 = cell2mat(rawNumericColumns(:, 268));
NeuHitsRawData.VarName270 = cell2mat(rawNumericColumns(:, 269));
NeuHitsRawData.VarName271 = cell2mat(rawNumericColumns(:, 270));
NeuHitsRawData.VarName272 = cell2mat(rawNumericColumns(:, 271));
NeuHitsRawData.VarName273 = cell2mat(rawNumericColumns(:, 272));
NeuHitsRawData.VarName274 = cell2mat(rawNumericColumns(:, 273));
NeuHitsRawData.VarName275 = cell2mat(rawNumericColumns(:, 274));
NeuHitsRawData.VarName276 = cell2mat(rawNumericColumns(:, 275));
NeuHitsRawData.VarName277 = cell2mat(rawNumericColumns(:, 276));
NeuHitsRawData.VarName278 = cell2mat(rawNumericColumns(:, 277));
NeuHitsRawData.VarName279 = cell2mat(rawNumericColumns(:, 278));
NeuHitsRawData.VarName280 = cell2mat(rawNumericColumns(:, 279));
NeuHitsRawData.VarName281 = cell2mat(rawNumericColumns(:, 280));
NeuHitsRawData.VarName282 = cell2mat(rawNumericColumns(:, 281));
NeuHitsRawData.VarName283 = cell2mat(rawNumericColumns(:, 282));
NeuHitsRawData.VarName284 = cell2mat(rawNumericColumns(:, 283));
NeuHitsRawData.VarName285 = cell2mat(rawNumericColumns(:, 284));
NeuHitsRawData.VarName286 = cell2mat(rawNumericColumns(:, 285));
NeuHitsRawData.VarName287 = cell2mat(rawNumericColumns(:, 286));
NeuHitsRawData.VarName288 = cell2mat(rawNumericColumns(:, 287));
NeuHitsRawData.VarName289 = cell2mat(rawNumericColumns(:, 288));
NeuHitsRawData.VarName290 = cell2mat(rawNumericColumns(:, 289));
NeuHitsRawData.VarName291 = cell2mat(rawNumericColumns(:, 290));
NeuHitsRawData.VarName292 = cell2mat(rawNumericColumns(:, 291));
NeuHitsRawData.VarName293 = cell2mat(rawNumericColumns(:, 292));
NeuHitsRawData.VarName294 = cell2mat(rawNumericColumns(:, 293));
NeuHitsRawData.VarName295 = cell2mat(rawNumericColumns(:, 294));
NeuHitsRawData.VarName296 = cell2mat(rawNumericColumns(:, 295));
NeuHitsRawData.VarName297 = cell2mat(rawNumericColumns(:, 296));
NeuHitsRawData.VarName298 = cell2mat(rawNumericColumns(:, 297));
NeuHitsRawData.VarName299 = cell2mat(rawNumericColumns(:, 298));
NeuHitsRawData.VarName300 = cell2mat(rawNumericColumns(:, 299));
NeuHitsRawData.VarName301 = cell2mat(rawNumericColumns(:, 300));
NeuHitsRawData.VarName302 = cell2mat(rawNumericColumns(:, 301));
NeuHitsRawData.VarName303 = cell2mat(rawNumericColumns(:, 302));
NeuHitsRawData.VarName304 = cell2mat(rawNumericColumns(:, 303));
NeuHitsRawData.VarName305 = cell2mat(rawNumericColumns(:, 304));
NeuHitsRawData.VarName306 = cell2mat(rawNumericColumns(:, 305));
NeuHitsRawData.VarName307 = cell2mat(rawNumericColumns(:, 306));
NeuHitsRawData.VarName308 = cell2mat(rawNumericColumns(:, 307));
NeuHitsRawData.VarName309 = cell2mat(rawNumericColumns(:, 308));
NeuHitsRawData.VarName310 = cell2mat(rawNumericColumns(:, 309));
NeuHitsRawData.VarName311 = cell2mat(rawNumericColumns(:, 310));
NeuHitsRawData.VarName312 = cell2mat(rawNumericColumns(:, 311));
NeuHitsRawData.VarName313 = cell2mat(rawNumericColumns(:, 312));
NeuHitsRawData.VarName314 = cell2mat(rawNumericColumns(:, 313));
NeuHitsRawData.VarName315 = cell2mat(rawNumericColumns(:, 314));
NeuHitsRawData.VarName316 = cell2mat(rawNumericColumns(:, 315));
NeuHitsRawData.VarName317 = cell2mat(rawNumericColumns(:, 316));
NeuHitsRawData.VarName318 = cell2mat(rawNumericColumns(:, 317));
NeuHitsRawData.VarName319 = cell2mat(rawNumericColumns(:, 318));
NeuHitsRawData.VarName320 = cell2mat(rawNumericColumns(:, 319));
NeuHitsRawData.VarName321 = cell2mat(rawNumericColumns(:, 320));
NeuHitsRawData.VarName322 = cell2mat(rawNumericColumns(:, 321));
NeuHitsRawData.VarName323 = cell2mat(rawNumericColumns(:, 322));
NeuHitsRawData.VarName324 = cell2mat(rawNumericColumns(:, 323));
NeuHitsRawData.VarName325 = cell2mat(rawNumericColumns(:, 324));
NeuHitsRawData.VarName326 = cell2mat(rawNumericColumns(:, 325));

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;

T = NeuHitsRawData; %NEU condition first
Electrodes = T.Fp1;
data_neu = T(:,2:326);
data_neu = data_neu{:,:};
meanNeu_electrodes = mean(data_neu);

Fp1 = data_neu(1,:);
Fz = data_neu(2,:);
F3 = data_neu(3,:);
F7 = data_neu(4,:);
FT9 = data_neu(5,:);
FC5 = data_neu(6,:);
FC1 = data_neu(7,:);
C3 = data_neu(8,:);
T7 = data_neu(9,:);
CP5 = data_neu(10,:);
CP1 = data_neu(11,:);
Pz = data_neu(12,:);
P3 = data_neu(13,:);
P7 = data_neu(14,:);
O1 = data_neu(15,:);
Oz = data_neu(16,:);
O2 = data_neu(17,:);
P4 = data_neu(18,:);
P8 = data_neu(19,:);
CP6 = data_neu(20,:);
CP2 = data_neu(21,:);
C4 = data_neu(22,:);
T8 = data_neu(23,:);
FT10 = data_neu(24,:);
FC6 = data_neu(25,:);
FC2 = data_neu(26,:);
F4 = data_neu(27,:);
F8 = data_neu(28,:);
Fp2 = data_neu(29,:);
AFz = data_neu(30,:);


Fp1 = data_neu(1,:);
Fz_neu = Fz;
F3_neu = F3;
F7 = data_neu(4,:);
FT9 = data_neu(5,:);
FC5 = data_neu(6,:);
FC1 = data_neu(7,:);
C3_neu = C3;
T7 = data_neu(9,:);
CP5 = data_neu(10,:);
CP1 = data_neu(11,:);
Pz_neu = Pz;
P3_neu = P3;
P7 = data_neu(14,:);
O1 = data_neu(15,:);
Oz = data_neu(16,:);
O2 = data_neu(17,:);
P4_neu = P4;
P8 = data_neu(19,:);
CP6 = data_neu(20,:);
CP2 = data_neu(21,:);
C4_neu = C4;
T8 = data_neu(23,:);
FT10 = data_neu(24,:);
FC6 = data_neu(25,:);
FC2 = data_neu(26,:);
F4_neu = F4;
F8 = data_neu(28,:);
Fp2 = data_neu(29,:);
AFz = data_neu(30,:);

 Cz =[CP1; CP2];
Cz_neu = mean(Cz);
data_selectedElectrodes_neu = [F3; F7; FC1; C3; T7; CP5; CP1; P3; P7; P4; P8; CP6; CP2; C4; T8; FC2; F4; F8;];


%OR
%
%ROIs
dataROIparietal_neu = [P3; CP1]
dataROIfrontal_neu = [Fp1; Fp2; F7; F3; Fz; AFz; F4; F8]
dataROIN170_neu = [T8; T7; C3; C4]
%%
%% Initialize variables.
filename = 'C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\DATA\eeg\tratado\Pos_Hits_Raw Data.txt';
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
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


%% Split data into numeric and string columns.
rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326]);
rawStringColumns = string(raw(:, 1));


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
PosHitsRawData = table;
PosHitsRawData.Fp1 = rawStringColumns(:, 1);
PosHitsRawData.VarName2 = cell2mat(rawNumericColumns(:, 1));
PosHitsRawData.VarName3 = cell2mat(rawNumericColumns(:, 2));
PosHitsRawData.VarName4 = cell2mat(rawNumericColumns(:, 3));
PosHitsRawData.VarName5 = cell2mat(rawNumericColumns(:, 4));
PosHitsRawData.VarName6 = cell2mat(rawNumericColumns(:, 5));
PosHitsRawData.VarName7 = cell2mat(rawNumericColumns(:, 6));
PosHitsRawData.VarName8 = cell2mat(rawNumericColumns(:, 7));
PosHitsRawData.VarName9 = cell2mat(rawNumericColumns(:, 8));
PosHitsRawData.VarName10 = cell2mat(rawNumericColumns(:, 9));
PosHitsRawData.VarName11 = cell2mat(rawNumericColumns(:, 10));
PosHitsRawData.VarName12 = cell2mat(rawNumericColumns(:, 11));
PosHitsRawData.VarName13 = cell2mat(rawNumericColumns(:, 12));
PosHitsRawData.VarName14 = cell2mat(rawNumericColumns(:, 13));
PosHitsRawData.VarName15 = cell2mat(rawNumericColumns(:, 14));
PosHitsRawData.VarName16 = cell2mat(rawNumericColumns(:, 15));
PosHitsRawData.VarName17 = cell2mat(rawNumericColumns(:, 16));
PosHitsRawData.VarName18 = cell2mat(rawNumericColumns(:, 17));
PosHitsRawData.VarName19 = cell2mat(rawNumericColumns(:, 18));
PosHitsRawData.VarName20 = cell2mat(rawNumericColumns(:, 19));
PosHitsRawData.VarName21 = cell2mat(rawNumericColumns(:, 20));
PosHitsRawData.VarName22 = cell2mat(rawNumericColumns(:, 21));
PosHitsRawData.VarName23 = cell2mat(rawNumericColumns(:, 22));
PosHitsRawData.VarName24 = cell2mat(rawNumericColumns(:, 23));
PosHitsRawData.VarName25 = cell2mat(rawNumericColumns(:, 24));
PosHitsRawData.VarName26 = cell2mat(rawNumericColumns(:, 25));
PosHitsRawData.VarName27 = cell2mat(rawNumericColumns(:, 26));
PosHitsRawData.VarName28 = cell2mat(rawNumericColumns(:, 27));
PosHitsRawData.VarName29 = cell2mat(rawNumericColumns(:, 28));
PosHitsRawData.VarName30 = cell2mat(rawNumericColumns(:, 29));
PosHitsRawData.VarName31 = cell2mat(rawNumericColumns(:, 30));
PosHitsRawData.VarName32 = cell2mat(rawNumericColumns(:, 31));
PosHitsRawData.VarName33 = cell2mat(rawNumericColumns(:, 32));
PosHitsRawData.VarName34 = cell2mat(rawNumericColumns(:, 33));
PosHitsRawData.VarName35 = cell2mat(rawNumericColumns(:, 34));
PosHitsRawData.VarName36 = cell2mat(rawNumericColumns(:, 35));
PosHitsRawData.VarName37 = cell2mat(rawNumericColumns(:, 36));
PosHitsRawData.VarName38 = cell2mat(rawNumericColumns(:, 37));
PosHitsRawData.VarName39 = cell2mat(rawNumericColumns(:, 38));
PosHitsRawData.VarName40 = cell2mat(rawNumericColumns(:, 39));
PosHitsRawData.VarName41 = cell2mat(rawNumericColumns(:, 40));
PosHitsRawData.VarName42 = cell2mat(rawNumericColumns(:, 41));
PosHitsRawData.VarName43 = cell2mat(rawNumericColumns(:, 42));
PosHitsRawData.VarName44 = cell2mat(rawNumericColumns(:, 43));
PosHitsRawData.VarName45 = cell2mat(rawNumericColumns(:, 44));
PosHitsRawData.VarName46 = cell2mat(rawNumericColumns(:, 45));
PosHitsRawData.VarName47 = cell2mat(rawNumericColumns(:, 46));
PosHitsRawData.VarName48 = cell2mat(rawNumericColumns(:, 47));
PosHitsRawData.VarName49 = cell2mat(rawNumericColumns(:, 48));
PosHitsRawData.VarName50 = cell2mat(rawNumericColumns(:, 49));
PosHitsRawData.VarName51 = cell2mat(rawNumericColumns(:, 50));
PosHitsRawData.VarName52 = cell2mat(rawNumericColumns(:, 51));
PosHitsRawData.VarName53 = cell2mat(rawNumericColumns(:, 52));
PosHitsRawData.VarName54 = cell2mat(rawNumericColumns(:, 53));
PosHitsRawData.VarName55 = cell2mat(rawNumericColumns(:, 54));
PosHitsRawData.VarName56 = cell2mat(rawNumericColumns(:, 55));
PosHitsRawData.VarName57 = cell2mat(rawNumericColumns(:, 56));
PosHitsRawData.VarName58 = cell2mat(rawNumericColumns(:, 57));
PosHitsRawData.VarName59 = cell2mat(rawNumericColumns(:, 58));
PosHitsRawData.VarName60 = cell2mat(rawNumericColumns(:, 59));
PosHitsRawData.VarName61 = cell2mat(rawNumericColumns(:, 60));
PosHitsRawData.VarName62 = cell2mat(rawNumericColumns(:, 61));
PosHitsRawData.VarName63 = cell2mat(rawNumericColumns(:, 62));
PosHitsRawData.VarName64 = cell2mat(rawNumericColumns(:, 63));
PosHitsRawData.VarName65 = cell2mat(rawNumericColumns(:, 64));
PosHitsRawData.VarName66 = cell2mat(rawNumericColumns(:, 65));
PosHitsRawData.VarName67 = cell2mat(rawNumericColumns(:, 66));
PosHitsRawData.VarName68 = cell2mat(rawNumericColumns(:, 67));
PosHitsRawData.VarName69 = cell2mat(rawNumericColumns(:, 68));
PosHitsRawData.VarName70 = cell2mat(rawNumericColumns(:, 69));
PosHitsRawData.VarName71 = cell2mat(rawNumericColumns(:, 70));
PosHitsRawData.VarName72 = cell2mat(rawNumericColumns(:, 71));
PosHitsRawData.VarName73 = cell2mat(rawNumericColumns(:, 72));
PosHitsRawData.VarName74 = cell2mat(rawNumericColumns(:, 73));
PosHitsRawData.VarName75 = cell2mat(rawNumericColumns(:, 74));
PosHitsRawData.VarName76 = cell2mat(rawNumericColumns(:, 75));
PosHitsRawData.VarName77 = cell2mat(rawNumericColumns(:, 76));
PosHitsRawData.VarName78 = cell2mat(rawNumericColumns(:, 77));
PosHitsRawData.VarName79 = cell2mat(rawNumericColumns(:, 78));
PosHitsRawData.VarName80 = cell2mat(rawNumericColumns(:, 79));
PosHitsRawData.VarName81 = cell2mat(rawNumericColumns(:, 80));
PosHitsRawData.VarName82 = cell2mat(rawNumericColumns(:, 81));
PosHitsRawData.VarName83 = cell2mat(rawNumericColumns(:, 82));
PosHitsRawData.VarName84 = cell2mat(rawNumericColumns(:, 83));
PosHitsRawData.VarName85 = cell2mat(rawNumericColumns(:, 84));
PosHitsRawData.VarName86 = cell2mat(rawNumericColumns(:, 85));
PosHitsRawData.VarName87 = cell2mat(rawNumericColumns(:, 86));
PosHitsRawData.VarName88 = cell2mat(rawNumericColumns(:, 87));
PosHitsRawData.VarName89 = cell2mat(rawNumericColumns(:, 88));
PosHitsRawData.VarName90 = cell2mat(rawNumericColumns(:, 89));
PosHitsRawData.VarName91 = cell2mat(rawNumericColumns(:, 90));
PosHitsRawData.VarName92 = cell2mat(rawNumericColumns(:, 91));
PosHitsRawData.VarName93 = cell2mat(rawNumericColumns(:, 92));
PosHitsRawData.VarName94 = cell2mat(rawNumericColumns(:, 93));
PosHitsRawData.VarName95 = cell2mat(rawNumericColumns(:, 94));
PosHitsRawData.VarName96 = cell2mat(rawNumericColumns(:, 95));
PosHitsRawData.VarName97 = cell2mat(rawNumericColumns(:, 96));
PosHitsRawData.VarName98 = cell2mat(rawNumericColumns(:, 97));
PosHitsRawData.VarName99 = cell2mat(rawNumericColumns(:, 98));
PosHitsRawData.VarName100 = cell2mat(rawNumericColumns(:, 99));
PosHitsRawData.VarName101 = cell2mat(rawNumericColumns(:, 100));
PosHitsRawData.VarName102 = cell2mat(rawNumericColumns(:, 101));
PosHitsRawData.VarName103 = cell2mat(rawNumericColumns(:, 102));
PosHitsRawData.VarName104 = cell2mat(rawNumericColumns(:, 103));
PosHitsRawData.VarName105 = cell2mat(rawNumericColumns(:, 104));
PosHitsRawData.VarName106 = cell2mat(rawNumericColumns(:, 105));
PosHitsRawData.VarName107 = cell2mat(rawNumericColumns(:, 106));
PosHitsRawData.VarName108 = cell2mat(rawNumericColumns(:, 107));
PosHitsRawData.VarName109 = cell2mat(rawNumericColumns(:, 108));
PosHitsRawData.VarName110 = cell2mat(rawNumericColumns(:, 109));
PosHitsRawData.VarName111 = cell2mat(rawNumericColumns(:, 110));
PosHitsRawData.VarName112 = cell2mat(rawNumericColumns(:, 111));
PosHitsRawData.VarName113 = cell2mat(rawNumericColumns(:, 112));
PosHitsRawData.VarName114 = cell2mat(rawNumericColumns(:, 113));
PosHitsRawData.VarName115 = cell2mat(rawNumericColumns(:, 114));
PosHitsRawData.VarName116 = cell2mat(rawNumericColumns(:, 115));
PosHitsRawData.VarName117 = cell2mat(rawNumericColumns(:, 116));
PosHitsRawData.VarName118 = cell2mat(rawNumericColumns(:, 117));
PosHitsRawData.VarName119 = cell2mat(rawNumericColumns(:, 118));
PosHitsRawData.VarName120 = cell2mat(rawNumericColumns(:, 119));
PosHitsRawData.VarName121 = cell2mat(rawNumericColumns(:, 120));
PosHitsRawData.VarName122 = cell2mat(rawNumericColumns(:, 121));
PosHitsRawData.VarName123 = cell2mat(rawNumericColumns(:, 122));
PosHitsRawData.VarName124 = cell2mat(rawNumericColumns(:, 123));
PosHitsRawData.VarName125 = cell2mat(rawNumericColumns(:, 124));
PosHitsRawData.VarName126 = cell2mat(rawNumericColumns(:, 125));
PosHitsRawData.VarName127 = cell2mat(rawNumericColumns(:, 126));
PosHitsRawData.VarName128 = cell2mat(rawNumericColumns(:, 127));
PosHitsRawData.VarName129 = cell2mat(rawNumericColumns(:, 128));
PosHitsRawData.VarName130 = cell2mat(rawNumericColumns(:, 129));
PosHitsRawData.VarName131 = cell2mat(rawNumericColumns(:, 130));
PosHitsRawData.VarName132 = cell2mat(rawNumericColumns(:, 131));
PosHitsRawData.VarName133 = cell2mat(rawNumericColumns(:, 132));
PosHitsRawData.VarName134 = cell2mat(rawNumericColumns(:, 133));
PosHitsRawData.VarName135 = cell2mat(rawNumericColumns(:, 134));
PosHitsRawData.VarName136 = cell2mat(rawNumericColumns(:, 135));
PosHitsRawData.VarName137 = cell2mat(rawNumericColumns(:, 136));
PosHitsRawData.VarName138 = cell2mat(rawNumericColumns(:, 137));
PosHitsRawData.VarName139 = cell2mat(rawNumericColumns(:, 138));
PosHitsRawData.VarName140 = cell2mat(rawNumericColumns(:, 139));
PosHitsRawData.VarName141 = cell2mat(rawNumericColumns(:, 140));
PosHitsRawData.VarName142 = cell2mat(rawNumericColumns(:, 141));
PosHitsRawData.VarName143 = cell2mat(rawNumericColumns(:, 142));
PosHitsRawData.VarName144 = cell2mat(rawNumericColumns(:, 143));
PosHitsRawData.VarName145 = cell2mat(rawNumericColumns(:, 144));
PosHitsRawData.VarName146 = cell2mat(rawNumericColumns(:, 145));
PosHitsRawData.VarName147 = cell2mat(rawNumericColumns(:, 146));
PosHitsRawData.VarName148 = cell2mat(rawNumericColumns(:, 147));
PosHitsRawData.VarName149 = cell2mat(rawNumericColumns(:, 148));
PosHitsRawData.VarName150 = cell2mat(rawNumericColumns(:, 149));
PosHitsRawData.VarName151 = cell2mat(rawNumericColumns(:, 150));
PosHitsRawData.VarName152 = cell2mat(rawNumericColumns(:, 151));
PosHitsRawData.VarName153 = cell2mat(rawNumericColumns(:, 152));
PosHitsRawData.VarName154 = cell2mat(rawNumericColumns(:, 153));
PosHitsRawData.VarName155 = cell2mat(rawNumericColumns(:, 154));
PosHitsRawData.VarName156 = cell2mat(rawNumericColumns(:, 155));
PosHitsRawData.VarName157 = cell2mat(rawNumericColumns(:, 156));
PosHitsRawData.VarName158 = cell2mat(rawNumericColumns(:, 157));
PosHitsRawData.VarName159 = cell2mat(rawNumericColumns(:, 158));
PosHitsRawData.VarName160 = cell2mat(rawNumericColumns(:, 159));
PosHitsRawData.VarName161 = cell2mat(rawNumericColumns(:, 160));
PosHitsRawData.VarName162 = cell2mat(rawNumericColumns(:, 161));
PosHitsRawData.VarName163 = cell2mat(rawNumericColumns(:, 162));
PosHitsRawData.VarName164 = cell2mat(rawNumericColumns(:, 163));
PosHitsRawData.VarName165 = cell2mat(rawNumericColumns(:, 164));
PosHitsRawData.VarName166 = cell2mat(rawNumericColumns(:, 165));
PosHitsRawData.VarName167 = cell2mat(rawNumericColumns(:, 166));
PosHitsRawData.VarName168 = cell2mat(rawNumericColumns(:, 167));
PosHitsRawData.VarName169 = cell2mat(rawNumericColumns(:, 168));
PosHitsRawData.VarName170 = cell2mat(rawNumericColumns(:, 169));
PosHitsRawData.VarName171 = cell2mat(rawNumericColumns(:, 170));
PosHitsRawData.VarName172 = cell2mat(rawNumericColumns(:, 171));
PosHitsRawData.VarName173 = cell2mat(rawNumericColumns(:, 172));
PosHitsRawData.VarName174 = cell2mat(rawNumericColumns(:, 173));
PosHitsRawData.VarName175 = cell2mat(rawNumericColumns(:, 174));
PosHitsRawData.VarName176 = cell2mat(rawNumericColumns(:, 175));
PosHitsRawData.VarName177 = cell2mat(rawNumericColumns(:, 176));
PosHitsRawData.VarName178 = cell2mat(rawNumericColumns(:, 177));
PosHitsRawData.VarName179 = cell2mat(rawNumericColumns(:, 178));
PosHitsRawData.VarName180 = cell2mat(rawNumericColumns(:, 179));
PosHitsRawData.VarName181 = cell2mat(rawNumericColumns(:, 180));
PosHitsRawData.VarName182 = cell2mat(rawNumericColumns(:, 181));
PosHitsRawData.VarName183 = cell2mat(rawNumericColumns(:, 182));
PosHitsRawData.VarName184 = cell2mat(rawNumericColumns(:, 183));
PosHitsRawData.VarName185 = cell2mat(rawNumericColumns(:, 184));
PosHitsRawData.VarName186 = cell2mat(rawNumericColumns(:, 185));
PosHitsRawData.VarName187 = cell2mat(rawNumericColumns(:, 186));
PosHitsRawData.VarName188 = cell2mat(rawNumericColumns(:, 187));
PosHitsRawData.VarName189 = cell2mat(rawNumericColumns(:, 188));
PosHitsRawData.VarName190 = cell2mat(rawNumericColumns(:, 189));
PosHitsRawData.VarName191 = cell2mat(rawNumericColumns(:, 190));
PosHitsRawData.VarName192 = cell2mat(rawNumericColumns(:, 191));
PosHitsRawData.VarName193 = cell2mat(rawNumericColumns(:, 192));
PosHitsRawData.VarName194 = cell2mat(rawNumericColumns(:, 193));
PosHitsRawData.VarName195 = cell2mat(rawNumericColumns(:, 194));
PosHitsRawData.VarName196 = cell2mat(rawNumericColumns(:, 195));
PosHitsRawData.VarName197 = cell2mat(rawNumericColumns(:, 196));
PosHitsRawData.VarName198 = cell2mat(rawNumericColumns(:, 197));
PosHitsRawData.VarName199 = cell2mat(rawNumericColumns(:, 198));
PosHitsRawData.VarName200 = cell2mat(rawNumericColumns(:, 199));
PosHitsRawData.VarName201 = cell2mat(rawNumericColumns(:, 200));
PosHitsRawData.VarName202 = cell2mat(rawNumericColumns(:, 201));
PosHitsRawData.VarName203 = cell2mat(rawNumericColumns(:, 202));
PosHitsRawData.VarName204 = cell2mat(rawNumericColumns(:, 203));
PosHitsRawData.VarName205 = cell2mat(rawNumericColumns(:, 204));
PosHitsRawData.VarName206 = cell2mat(rawNumericColumns(:, 205));
PosHitsRawData.VarName207 = cell2mat(rawNumericColumns(:, 206));
PosHitsRawData.VarName208 = cell2mat(rawNumericColumns(:, 207));
PosHitsRawData.VarName209 = cell2mat(rawNumericColumns(:, 208));
PosHitsRawData.VarName210 = cell2mat(rawNumericColumns(:, 209));
PosHitsRawData.VarName211 = cell2mat(rawNumericColumns(:, 210));
PosHitsRawData.VarName212 = cell2mat(rawNumericColumns(:, 211));
PosHitsRawData.VarName213 = cell2mat(rawNumericColumns(:, 212));
PosHitsRawData.VarName214 = cell2mat(rawNumericColumns(:, 213));
PosHitsRawData.VarName215 = cell2mat(rawNumericColumns(:, 214));
PosHitsRawData.VarName216 = cell2mat(rawNumericColumns(:, 215));
PosHitsRawData.VarName217 = cell2mat(rawNumericColumns(:, 216));
PosHitsRawData.VarName218 = cell2mat(rawNumericColumns(:, 217));
PosHitsRawData.VarName219 = cell2mat(rawNumericColumns(:, 218));
PosHitsRawData.VarName220 = cell2mat(rawNumericColumns(:, 219));
PosHitsRawData.VarName221 = cell2mat(rawNumericColumns(:, 220));
PosHitsRawData.VarName222 = cell2mat(rawNumericColumns(:, 221));
PosHitsRawData.VarName223 = cell2mat(rawNumericColumns(:, 222));
PosHitsRawData.VarName224 = cell2mat(rawNumericColumns(:, 223));
PosHitsRawData.VarName225 = cell2mat(rawNumericColumns(:, 224));
PosHitsRawData.VarName226 = cell2mat(rawNumericColumns(:, 225));
PosHitsRawData.VarName227 = cell2mat(rawNumericColumns(:, 226));
PosHitsRawData.VarName228 = cell2mat(rawNumericColumns(:, 227));
PosHitsRawData.VarName229 = cell2mat(rawNumericColumns(:, 228));
PosHitsRawData.VarName230 = cell2mat(rawNumericColumns(:, 229));
PosHitsRawData.VarName231 = cell2mat(rawNumericColumns(:, 230));
PosHitsRawData.VarName232 = cell2mat(rawNumericColumns(:, 231));
PosHitsRawData.VarName233 = cell2mat(rawNumericColumns(:, 232));
PosHitsRawData.VarName234 = cell2mat(rawNumericColumns(:, 233));
PosHitsRawData.VarName235 = cell2mat(rawNumericColumns(:, 234));
PosHitsRawData.VarName236 = cell2mat(rawNumericColumns(:, 235));
PosHitsRawData.VarName237 = cell2mat(rawNumericColumns(:, 236));
PosHitsRawData.VarName238 = cell2mat(rawNumericColumns(:, 237));
PosHitsRawData.VarName239 = cell2mat(rawNumericColumns(:, 238));
PosHitsRawData.VarName240 = cell2mat(rawNumericColumns(:, 239));
PosHitsRawData.VarName241 = cell2mat(rawNumericColumns(:, 240));
PosHitsRawData.VarName242 = cell2mat(rawNumericColumns(:, 241));
PosHitsRawData.VarName243 = cell2mat(rawNumericColumns(:, 242));
PosHitsRawData.VarName244 = cell2mat(rawNumericColumns(:, 243));
PosHitsRawData.VarName245 = cell2mat(rawNumericColumns(:, 244));
PosHitsRawData.VarName246 = cell2mat(rawNumericColumns(:, 245));
PosHitsRawData.VarName247 = cell2mat(rawNumericColumns(:, 246));
PosHitsRawData.VarName248 = cell2mat(rawNumericColumns(:, 247));
PosHitsRawData.VarName249 = cell2mat(rawNumericColumns(:, 248));
PosHitsRawData.VarName250 = cell2mat(rawNumericColumns(:, 249));
PosHitsRawData.VarName251 = cell2mat(rawNumericColumns(:, 250));
PosHitsRawData.VarName252 = cell2mat(rawNumericColumns(:, 251));
PosHitsRawData.VarName253 = cell2mat(rawNumericColumns(:, 252));
PosHitsRawData.VarName254 = cell2mat(rawNumericColumns(:, 253));
PosHitsRawData.VarName255 = cell2mat(rawNumericColumns(:, 254));
PosHitsRawData.VarName256 = cell2mat(rawNumericColumns(:, 255));
PosHitsRawData.VarName257 = cell2mat(rawNumericColumns(:, 256));
PosHitsRawData.VarName258 = cell2mat(rawNumericColumns(:, 257));
PosHitsRawData.VarName259 = cell2mat(rawNumericColumns(:, 258));
PosHitsRawData.VarName260 = cell2mat(rawNumericColumns(:, 259));
PosHitsRawData.VarName261 = cell2mat(rawNumericColumns(:, 260));
PosHitsRawData.VarName262 = cell2mat(rawNumericColumns(:, 261));
PosHitsRawData.VarName263 = cell2mat(rawNumericColumns(:, 262));
PosHitsRawData.VarName264 = cell2mat(rawNumericColumns(:, 263));
PosHitsRawData.VarName265 = cell2mat(rawNumericColumns(:, 264));
PosHitsRawData.VarName266 = cell2mat(rawNumericColumns(:, 265));
PosHitsRawData.VarName267 = cell2mat(rawNumericColumns(:, 266));
PosHitsRawData.VarName268 = cell2mat(rawNumericColumns(:, 267));
PosHitsRawData.VarName269 = cell2mat(rawNumericColumns(:, 268));
PosHitsRawData.VarName270 = cell2mat(rawNumericColumns(:, 269));
PosHitsRawData.VarName271 = cell2mat(rawNumericColumns(:, 270));
PosHitsRawData.VarName272 = cell2mat(rawNumericColumns(:, 271));
PosHitsRawData.VarName273 = cell2mat(rawNumericColumns(:, 272));
PosHitsRawData.VarName274 = cell2mat(rawNumericColumns(:, 273));
PosHitsRawData.VarName275 = cell2mat(rawNumericColumns(:, 274));
PosHitsRawData.VarName276 = cell2mat(rawNumericColumns(:, 275));
PosHitsRawData.VarName277 = cell2mat(rawNumericColumns(:, 276));
PosHitsRawData.VarName278 = cell2mat(rawNumericColumns(:, 277));
PosHitsRawData.VarName279 = cell2mat(rawNumericColumns(:, 278));
PosHitsRawData.VarName280 = cell2mat(rawNumericColumns(:, 279));
PosHitsRawData.VarName281 = cell2mat(rawNumericColumns(:, 280));
PosHitsRawData.VarName282 = cell2mat(rawNumericColumns(:, 281));
PosHitsRawData.VarName283 = cell2mat(rawNumericColumns(:, 282));
PosHitsRawData.VarName284 = cell2mat(rawNumericColumns(:, 283));
PosHitsRawData.VarName285 = cell2mat(rawNumericColumns(:, 284));
PosHitsRawData.VarName286 = cell2mat(rawNumericColumns(:, 285));
PosHitsRawData.VarName287 = cell2mat(rawNumericColumns(:, 286));
PosHitsRawData.VarName288 = cell2mat(rawNumericColumns(:, 287));
PosHitsRawData.VarName289 = cell2mat(rawNumericColumns(:, 288));
PosHitsRawData.VarName290 = cell2mat(rawNumericColumns(:, 289));
PosHitsRawData.VarName291 = cell2mat(rawNumericColumns(:, 290));
PosHitsRawData.VarName292 = cell2mat(rawNumericColumns(:, 291));
PosHitsRawData.VarName293 = cell2mat(rawNumericColumns(:, 292));
PosHitsRawData.VarName294 = cell2mat(rawNumericColumns(:, 293));
PosHitsRawData.VarName295 = cell2mat(rawNumericColumns(:, 294));
PosHitsRawData.VarName296 = cell2mat(rawNumericColumns(:, 295));
PosHitsRawData.VarName297 = cell2mat(rawNumericColumns(:, 296));
PosHitsRawData.VarName298 = cell2mat(rawNumericColumns(:, 297));
PosHitsRawData.VarName299 = cell2mat(rawNumericColumns(:, 298));
PosHitsRawData.VarName300 = cell2mat(rawNumericColumns(:, 299));
PosHitsRawData.VarName301 = cell2mat(rawNumericColumns(:, 300));
PosHitsRawData.VarName302 = cell2mat(rawNumericColumns(:, 301));
PosHitsRawData.VarName303 = cell2mat(rawNumericColumns(:, 302));
PosHitsRawData.VarName304 = cell2mat(rawNumericColumns(:, 303));
PosHitsRawData.VarName305 = cell2mat(rawNumericColumns(:, 304));
PosHitsRawData.VarName306 = cell2mat(rawNumericColumns(:, 305));
PosHitsRawData.VarName307 = cell2mat(rawNumericColumns(:, 306));
PosHitsRawData.VarName308 = cell2mat(rawNumericColumns(:, 307));
PosHitsRawData.VarName309 = cell2mat(rawNumericColumns(:, 308));
PosHitsRawData.VarName310 = cell2mat(rawNumericColumns(:, 309));
PosHitsRawData.VarName311 = cell2mat(rawNumericColumns(:, 310));
PosHitsRawData.VarName312 = cell2mat(rawNumericColumns(:, 311));
PosHitsRawData.VarName313 = cell2mat(rawNumericColumns(:, 312));
PosHitsRawData.VarName314 = cell2mat(rawNumericColumns(:, 313));
PosHitsRawData.VarName315 = cell2mat(rawNumericColumns(:, 314));
PosHitsRawData.VarName316 = cell2mat(rawNumericColumns(:, 315));
PosHitsRawData.VarName317 = cell2mat(rawNumericColumns(:, 316));
PosHitsRawData.VarName318 = cell2mat(rawNumericColumns(:, 317));
PosHitsRawData.VarName319 = cell2mat(rawNumericColumns(:, 318));
PosHitsRawData.VarName320 = cell2mat(rawNumericColumns(:, 319));
PosHitsRawData.VarName321 = cell2mat(rawNumericColumns(:, 320));
PosHitsRawData.VarName322 = cell2mat(rawNumericColumns(:, 321));
PosHitsRawData.VarName323 = cell2mat(rawNumericColumns(:, 322));
PosHitsRawData.VarName324 = cell2mat(rawNumericColumns(:, 323));
PosHitsRawData.VarName325 = cell2mat(rawNumericColumns(:, 324));
PosHitsRawData.VarName326 = cell2mat(rawNumericColumns(:, 325));


 Cz =[CP1; CP2];
Cz = mean(Cz);

F3_pos = F3 
Fz_pos = Fz
F4_pos = F4
C3_pos = C3
Cz_pos = Cz
C4_pos = C4
P3_pos = P3
Pz_pos = Pz
P4_pos = P4

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns R;


T = PosHitsRawData; %POS condition first
Electrodes = T.Fp1;
data_pos = T(:,2:326);
data_pos = data_pos{:,:};
meanPos_electrodes = mean(data_pos);

Fp1 = data_pos(1,:);
Fz = data_pos(2,:);
F3 = data_pos(3,:);
F7 = data_pos(4,:);
FT9 = data_pos(5,:);
FC5 = data_pos(6,:);
FC1 = data_pos(7,:);
C3 = data_pos(8,:);
T7 = data_pos(9,:);
CP5 = data_pos(10,:);
CP1 = data_pos(11,:);
Pz = data_pos(12,:);
P3 = data_pos(13,:);
P7 = data_pos(14,:);
O1 = data_pos(15,:);
Oz = data_pos(16,:);
O2 = data_pos(17,:);
P4 = data_pos(18,:);
P8 = data_pos(19,:);
CP6 = data_pos(20,:);
CP2 = data_pos(21,:);
C4 = data_pos(22,:);
T8 = data_pos(23,:);
FT10 = data_pos(24,:);
FC6 = data_pos(25,:);
FC2 = data_pos(26,:);
F4 = data_pos(27,:);
F8 = data_pos(28,:);
Fp2 = data_pos(29,:);
AFz = data_pos(30,:);

data_selectedElectrodes_pos = [F3; F7; FC1; C3; T7; CP5; CP1; P3; P7; P4; P8; CP6; CP2; C4; T8; FC2; F4; F8;];
Cz =[CP1; CP2];
Cz = mean(Cz);

F3_pos = F3 
Fz_pos = Fz
F4_pos = F4
C3_pos = C3
Cz_pos = Cz
C4_pos = C4
P3_pos = P3
Pz_pos = Pz
P4_pos = P4

%
%ROIs
dataROIparietal_pos = [P3; Pz; O1]
dataROIfrontal_pos = [Fp1; Fp2; F7; F3; Fz; AFz; F4; F8]
dataROIN170_pos = [T8; T7; C3; C4]
%emo elec

Fp1 = [data_pos(1,:); data_neg(1,:)];
Fp1 = mean(Fp1);

Fz = [data_pos(2,:); data_neg(2,:)];
Fz = mean(Fz);

F3 = [data_pos(3,:); data_neg(3,:)];
F3 = mean(F3);

F7 = [data_pos(4,:); data_neg(4,:)];
F7 = mean(F7);

FT9 = [data_pos(5,:); data_neg(5,:)];
FT9 = mean(FT9);

FC5 = [data_pos(6,:); data_neg(6,:)];
FC5 = mean(FC5);

FC1 = [data_pos(7,:); data_neg(7,:)];
FC1 = mean(FC1);

C3 = [data_pos(8,:); data_neg(8,:)];
C3 = mean(C3);

T7 = [data_pos(9,:); data_neg(9,:)];
T7 = mean(T7);

CP5 = [data_pos(10,:); data_neg(10,:)];
CP5 = mean(CP5);

CP1 = [data_pos(11,:); data_neg(11,:)];
CP1= mean(CP1);

Pz = [data_pos(12,:); data_neg(12,:)];
Pz = mean(Pz);

P3 = [data_pos(13,:); data_neg(13,:)];
P3 = mean(P3);

P7 = [data_pos(14,:); data_neg(14,:)];
P7 = mean(P7);

O1 = [data_pos(15,:); data_neg(15,:)];
O1 = mean(O1);

Oz = [data_pos(16,:); data_neg(16,:)];
Oz = mean(Oz);

O2 = [data_pos(17,:); data_neg(17,:)];
O2 = mean(O2);

P4 = [data_pos(18,:); data_neg(18,:)];
P4 = mean(P4);

P8 = [data_pos(19,:); data_neg(19,:)];
P8 = mean(P8);

CP6 = [data_pos(20,:); data_neg(20,:)];
CP6 = mean(CP6);

CP2 = [data_pos(21,:); data_neg(21,:)];
CP2 = mean(CP2);

C4 = [data_pos(22,:); data_neg(22,:)];
C4 = mean(C4);

T8 = [data_pos(23,:); data_neg(23,:)];
T8 = mean(T8);

FT10 = [data_pos(24,:); data_neg(24,:)];
FT10 = mean(FT10);

FC6 = [data_pos(25,:); data_neg(25,:)];
FC6 = mean(FC6);

FC2 = [data_pos(26,:); data_neg(26,:)];
FC2 = mean(FC2);

F4 = [data_pos(27,:); data_neg(27,:)];
F4 = mean(F4);

F8 = [data_pos(28,:); data_neg(28,:)];
F8 = mean(F8);

Fp2 = [data_pos(29,:); data_neg(29,:)];
Fp2 = mean(Fp2);

AFz = [data_pos(30,:);data_neg(30,:)];
AFz = mean(AFz);

data_selectedElectrodes_emo = [F3; F7; FC1; C3; T7; CP5; CP1; P3; P7; P4; P8; CP6; CP2; C4; T8; FC2; F4; F8;];

F3_emo = F3 
Fz_emo = Fz
F4_emo = F4
C3_emo = C3
Cz_emo = Cz
C4_emo = C4
P3_emo = P3
Pz_emo = Pz
P4_emo = P4



data_emo = [Fp1;
Fz;
F3;
F7;
FT9;
FC5;
FC1;
C3;
T7;
CP5;
CP1;
Pz;
P3;
P7;
O1;
Oz;
O2;
P4;
P8;
CP6;
CP2;
C4;
T8;
FT10;
FC6;
FC2;
F4;
F8;
Fp2;
AFz];

mean_emo = [meanPos_electrodes;meanNeg_electrodes]
mean_emo = mean(mean_emo)

%
%ROIs
dataROIparietal_emo = [P3; CP1]
dataROIfrontal_emo = [Fp1; Fp2; F7; F3; Fz; AFz; F4; F8]
dataROIN170_emo = [T8; T7; C3; C4]
% ...
% n = length(Electrodes);
% for c = 1:n
% Electrodes(c) = data(:,c);
% end
% %
% 
%Define sampling rate, dt and time vector

srate = 250;
dt = 1/srate;
time_vector = -0.1:dt:dt*length(data_new)-dt-0.1;
%
%todos os contextos

figure;
plot(time_vector,meanNew_electrodes, 'Linewidth',6, 'Color', [0, 0.4470, 0.7410])
hold on
plot(time_vector,meanNeg_electrodes, 'Linewidth',6, 'Color', [0.8500, 0.3250, 0.0980])
hold on
plot(time_vector,meanNeu_electrodes, 'Linewidth',6, 'Color', [0.9290, 0.6940, 0.1250])
hold on
plot(time_vector,meanPos_electrodes, 'Linewidth',6, 'Color', [0.4940, 0.1840, 0.5560])
hold on
axis tight
line([0 0], [6 -4],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Negative, Neutral and Positive contexts, and Correct rejections')
hold off

%emo, neu e CR

figure;
plot(time_vector,meanNew_electrodes, 'Linewidth',6, 'Color', [0, 0.4470, 0.7410])
hold on
plot(time_vector,mean_emo, 'Linewidth',6, 'Color', [0.6350, 0.0780, 0.1840])
hold on
plot(time_vector,meanNeu_electrodes, 'Linewidth',6, 'Color', [0.9290, 0.6940, 0.1250])
hold on
axis tight
line([0 0], [6 -4],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Emotional Hits, Neutral Hits and Correct rejections')
hold off
%old/new

figure;
plot(time_vector,meanNew_electrodes, 'Linewidth',6, 'Color', [0, 0.4470, 0.7410])
hold on
plot(time_vector,meanOld_electrodes, 'Linewidth',6, 'Color', [0.4660, 0.6740, 0.1880])
hold on

axis tight
line([0 0], [4 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Hits and Correct rejections')
hold off

%Plot
figure;
plot(time_vector, data_new);
hold on
plot(time_vector,meanNew_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Correct Rejections')
hold off
% 
%Import data for OLD condition
%
data_old = T(:,2:326);
data_old = data_old{:,:};
meanOld_electrodes = mean(data_old);
%
%
%Plot
%
figure;
plot(time_vector, data_old);
hold on
plot(time_vector,meanOld_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Hits')
hold off
%
figure;
plot(time_vector,meanOld_electrodes,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,meanNew_electrodes,'Linewidth',6, 'Color','r')
axis tight
line([0 0], [6 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title('Old(Black) vs New(Red)')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
hold off


%Import data for other negative condition
%
%
data_neg = T(:,2:326);
data_neg = data_neg{:,:};
meanNeg_electrodes = mean(data_neg);


%plot
figure;
plot(time_vector, data_neg);
hold on
plot(time_vector,meanNeg_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Negative Hits')
hold off



%plot
figure;
plot(time_vector, data_neu);
hold on
plot(time_vector,meanNeu_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.2],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Neutral Hits')
hold off




%plot
figure;
plot(time_vector, data_pos);
hold on
plot(time_vector,meanPos_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.2],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Positive Hits')
hold off
%
%
%plot comparisons
figure;
plot(time_vector,meanNew_electrodes,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanNeg_electrodes,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanNeu_electrodes,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanPos_electrodes,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [5 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off



%plot comparisons parietal ROI
figure;
plot(time_vector,meanROIparietal_new,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanROIparietal_neg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanROIparietal_neu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanROIparietal_pos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [5 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off

%rename the electrodes on line 17 and do it again for old  
%Select time frame for analysis


meanROIparietal_new = mean(dataROIparietal_new)
meanROIfrontal_new = mean(dataROIfrontal_new)
meanROIN170_new = mean(dataROIN170_new)
meanROIN250_new = mean(dataROIN250_new)

meanROIparietal_old = mean(dataROIparietal_old)
meanROIfrontal_old = mean(dataROIfrontal_old)
meanROIN170_old = mean(dataROIN170_old)
meanROIN250_old = mean(dataROIN250_old)

meanROIparietal_neg = mean(dataROIparietal_neg)
meanROIfrontal_neg = mean(dataROIfrontal_neg)
meanROIN170_neg = mean(dataROIN170_neg)
meanROIN250_neg = mean(dataROIN250_neg)

meanROIparietal_neu = mean(dataROIparietal_neu)
meanROIfrontal_neu = mean(dataROIfrontal_neu)
meanROIN170_neu = mean(dataROIN170_neu)
meanROIN250_neu = mean(dataROIN250_neu)

meanROIparietal_pos = mean(dataROIparietal_pos)
meanROIfrontal_pos = mean(dataROIfrontal_pos)
meanROIN170_pos = mean(dataROIN170_pos)
meanROIN250_pos = mean(dataROIN250_pos)

data_new200_300 = data_new(:,76:101);
data_old200_300 = data_old(:,76:101);

data_new300_500 = data_new(:,101:151);
data_old300_500 = data_old(:,101:151);

data_new500_800 = data_new(:,151:226);
data_old500_800 = data_old(:,151:226);

data_new800_1100 = data_new(:,226:301);
data_old800_1100 = data_old(:,226:301);


data_neg200_300 = data_neg(:,76:101);
data_neu200_300 = data_neu(:,76:101);
data_pos200_300 = data_pos(:,76:101);

data_emo200_300 = data_emo(:,76:101);

data_neg300_500 = data_neg(:,101:151);
data_neu300_500 = data_neu(:,101:151);
data_pos300_500 = data_pos(:,101:151);

data_emo300_500 = data_emo(:,101:151);

data_neg500_800 = data_neg(:,151:226);
data_neu500_800 = data_neu(:,151:226);
data_pos500_800 = data_pos(:,151:226);

data_emo500_800 = data_emo(:,151:226);

data_neg800_1100 = data_neg(:,226:301);
data_neu800_1100 = data_neu(:,226:301);
data_pos800_1100 = data_pos(:,226:301);

data_emo800_1100 = data_emo(:,226:301);

dataSelected_new200_300 = data_selectedElectrodes_new(:,76:101);
dataSelected_old200_300 = data_selectedElectrodes_old(:,76:101);

dataSelected_new300_500 = data_selectedElectrodes_new(:,101:151);
dataSelected_old300_500 = data_selectedElectrodes_old(:,101:151);

dataSelected_new500_800 = data_selectedElectrodes_new(:,151:226);
dataSelected_old500_800 = data_selectedElectrodes_old(:,151:226);

dataSelected_new800_1100 = data_selectedElectrodes_new(:,226:301);
dataSelected_old800_1100 = data_selectedElectrodes_old(:,226:301);

dataSelected_neg200_300 = data_selectedElectrodes_neg(:,76:101);
dataSelected_neg300_500 = data_selectedElectrodes_neg(:,101:151);
dataSelected_neg500_800 = data_selectedElectrodes_neg(:,151:226);
dataSelected_neg800_1100 = data_selectedElectrodes_neg(:,226:301);

dataSelected_neu200_300 = data_selectedElectrodes_neu(:,76:101);
dataSelected_neu300_500 = data_selectedElectrodes_neu(:,101:151);
dataSelected_neu500_800 = data_selectedElectrodes_neu(:,151:226);
dataSelected_neu800_1100 = data_selectedElectrodes_neu(:,226:301);

dataSelected_pos200_300 = data_selectedElectrodes_pos(:,76:101);
dataSelected_pos300_500 = data_selectedElectrodes_pos(:,101:151);
dataSelected_pos500_800 = data_selectedElectrodes_pos(:,151:226);
dataSelected_pos800_1100 = data_selectedElectrodes_pos(:,226:301);

dataSelected_emo200_300 = data_selectedElectrodes_emo(:,76:101);
dataSelected_emo300_500 = data_selectedElectrodes_emo(:,101:151);
dataSelected_emo500_800 = data_selectedElectrodes_emo(:,151:226);
dataSelected_emo800_1100 = data_selectedElectrodes_emo(:,226:301);





%TestT
%Fazer média dos dados em cada timeframe e fazer testT para cada condição
meanSelected_old200_300 = [];
mean_old200_300 = [];
meanSelected_old200_300 = mean(dataSelected_old200_300');
mean_old200_300 = mean(data_old200_300');

meanSelected_old300_500 = [];
mean_old300_500 = [];
meanSelected_old300_500 = mean(dataSelected_old300_500');
mean_old300_500 = mean(data_old300_500');

meanSelected_old500_800 = [];
mean_old500_800 = [];
meanSelected_old500_800 = mean(dataSelected_old500_800');
mean_old500_800 = mean(data_old500_800');

meanSelected_old800_1100 = [];
mean_old800_1100 = [];
meanSelected_old800_1100 = mean(dataSelected_old800_1100');
mean_old800_1100 = mean(data_old800_1100');


meanSelected_new200_300 = [];
mean_new200_300 = [];
meanSelected_new200_300 = mean(dataSelected_new200_300');
mean_new200_300 = mean(data_new200_300');

meanSelected_new300_500 = [];
mean_new300_500 = [];
meanSelected_new300_500 = mean(dataSelected_new300_500');
mean_new300_500 = mean(data_new300_500');

meanSelected_new500_800 = [];
mean_new500_800 = [];
meanSelected_new500_800 = mean(dataSelected_new500_800');
mean_new500_800 = mean(data_new500_800');

meanSelected_new800_1100 = [];
mean_new800_1100 = [];
meanSelected_new800_1100 = mean(dataSelected_new800_1100');
mean_new800_1100 = mean(data_new800_1100');


meanSelected_neg200_300 = [];
mean_neg200_300 = [];
meanSelected_neg200_300 = mean(dataSelected_neg200_300');
mean_neg200_300 = mean(data_neg200_300');

meanSelected_neg300_500 = [];
mean_neg300_500 = [];
meanSelected_neg300_500 = mean(dataSelected_neg300_500');
mean_neg300_500 = mean(data_neg300_500');

meanSelected_neg500_800 = [];
mean_neg500_800 = [];
meanSelected_neg500_800 = mean(dataSelected_neg500_800');
mean_neg500_800 = mean(data_neg500_800');

meanSelected_neg800_1100 = [];
mean_neg800_1100 = [];
meanSelected_neg800_1100 = mean(dataSelected_neg800_1100');
mean_neg800_1100 = mean(data_neg800_1100');

meanSelected_neu200_300 = [];
mean_neu200_300 = [];
meanSelected_neu200_300 = mean(dataSelected_neu200_300');
mean_neu200_300 = mean(data_neu200_300');

meanSelected_neu300_500 = [];
mean_neu300_500 = [];
meanSelected_neu300_500 = mean(dataSelected_neu300_500');
mean_neu300_500 = mean(data_neu300_500');

meanSelected_neu500_800 = [];
mean_neu500_800 = [];
meanSelected_neu500_800 = mean(dataSelected_neu500_800');
mean_neu500_800 = mean(data_neu500_800');

meanSelected_neu800_1100 = [];
mean_neu800_1100 = [];
meanSelected_neu800_1100 = mean(dataSelected_neu800_1100');
mean_neu800_1100 = mean(data_neu800_1100');

meanSelected_pos200_300 = [];
mean_pos200_300 = [];
meanSelected_pos200_300 = mean(dataSelected_pos200_300');
mean_pos200_300 = mean(data_pos200_300');

meanSelected_pos300_500 = [];
mean_pos300_500 = [];
meanSelected_pos300_500 = mean(dataSelected_pos300_500');
mean_pos300_500 = mean(data_pos300_500');

meanSelected_pos500_800 = [];
mean_pos500_800 = [];
meanSelected_pos500_800 = mean(dataSelected_pos500_800');
mean_pos500_800 = mean(data_pos500_800');

meanSelected_pos800_1100 = [];
mean_pos800_1100 = [];
meanSelected_pos800_1100 = mean(dataSelected_pos800_1100');
mean_pos800_1100 = mean(data_pos800_1100');


meanSelected_emo200_300 = [];
mean_emo200_300 = [];
meanSelected_emo200_300 = mean(dataSelected_emo200_300');
mean_emo200_300 = mean(data_emo200_300');

meanSelected_emo300_500 = [];
mean_emo300_500 = [];
meanSelected_emo300_500 = mean(dataSelected_emo300_500');
mean_emo300_500 = mean(data_emo300_500');

meanSelected_emo500_800 = [];
mean_emo500_800 = [];
meanSelected_emo500_800 = mean(dataSelected_emo500_800');
mean_emo500_800 = mean(data_emo500_800');

meanSelected_emo800_1100 = [];
mean_emo800_1100 = [];
meanSelected_emo800_1100 = mean(dataSelected_emo800_1100');
mean_emo800_1100 = mean(data_emo800_1100');



[h,p]=ttest(meanSelected_old200_300,meanSelected_new200_300);
%ANOVA (ainda preciso pensar como organizar a tabela pra fazer uma grande anova talvez precise pedir ajuda do pedro)
%Pedro vai ajudar --- Se bobar testesT nem vao ser utilizados


% Topography plot, select time frame
% feito com 30 eletrodos, ainda possivel fazer com os 18 selecionados
% 
% import selectedElectrodesposition.locs(se quiser fazer com os eletrodos selecionados algumas variaveis vao ter que ser modificadas) or AllElectrodesposition.locs (both in samplelocs eeglab folder) if it wasnt already imported in the
% begining. Rename second and third column as X and Y
% introduction to topographical plotting

% get cartesian coordinates
[elocsX,elocsY] = pol2cart(pi/180*[AllElectrodesposition.X],[AllElectrodesposition.Y]);

% plot electrode locations
figure;
scatter(elocsY,elocsX,100,'ro','filled');
set(gca,'xlim',[-.6 .6],'ylim',[-.6 .6])
axis square
title('Electrode locations')
% define XY points for interpolation
interp_detail =5000;
interpX = linspace(min(elocsX)-1,max(elocsX)+1,interp_detail);
interpY = linspace(min(elocsY)-1,max(elocsY)+1,interp_detail);
% meshgrid is a function that creates 2D grid locations based on 1D inputs
[gridX,gridY] = meshgrid(interpX,interpY);
% let's look at these matrices
hold on
plot3(gridY(:),gridX(:),-ones(1,interp_detail^2),'k.')
% extract data and interpolate to 2D grid

timepoint2plot = 0.2; % in ms
% convert time point from ms to index
[~,timepointidx] = min(abs(time_vector-timepoint2plot));

% data from this frequency from some other matrix
dat = double( mean(data_new(:,timepointidx,:),3) );
% now interpolate the data on a 2D grid
interpFunction = TriScatteredInterp(elocsY,elocsX,dat);
topodata = interpFunction(gridX,gridY);
figure, clf

% contourf
subplot(221)
contourf(interpY,interpX,topodata,100,'linecolor','none');
axis square
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
title('Interpolated data using ''contourf''')

% surface
subplot(222)
surf(interpY,interpX,topodata);
xlabel('left-right of scalp'), ylabel('anterior-posterior of scalp'), zlabel('\muV')
shading interp, axis square
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
rotate3d on, view(0,90)
title('Interpolated data using ''surf''')

% pixelated image
subplot(223)
imagesc(interpY,interpX,topodata);
xlabel('left-right of scalp'), ylabel('anterior-posterior of scalp'), zlabel('\muV')
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
title('Interpolated data using ''imagesc''')

% eeglab function
subplot(224)
topoplot(dat,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Interpolated data using eeglab ''topoplot''')


figure;
topoplot(dat,'AllElectrodesposition.locs'); % eeglab's topoplot function
%title('Interpolated data using eeglab ''topoplot''')
% useful bit of code to see channel locations
hold on
topoplot([],'AllElectrodesposition.locs','electrodes','ptslabels');
% hint: click on an electrode to see its corresponding index (number)
%
%
%Próximo passo fazer um subplot com mapas topograficos das três epochs para
%as condições old/new

% data from this frequency from some other matrix
dat1 = mean_new200_300';
dat2 = mean_new300_500';
dat3 = mean_new500_800';
dat4 = mean_new800_1100';
dat5 = mean_old200_300';
dat6 = mean_old300_500';
dat7 = mean_old500_800';
dat8 = mean_old800_1100';
% now interpolate the data on a 2D grid
interpFunction = TriScatteredInterp(elocsY,elocsX,dat1);
topodata = interpFunction(gridX,gridY);
figure, clf

subplot(241)
topoplot(dat1,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat2);
topodata = interpFunction(gridX,gridY);


subplot(242)
topoplot(dat2,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat3);
topodata = interpFunction(gridX,gridY);


subplot(243)
topoplot(dat3,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat4);
topodata = interpFunction(gridX,gridY);


subplot(244)
topoplot(dat4,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat4)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat5);
topodata = interpFunction(gridX,gridY);


subplot(245)
topoplot(dat5,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Old 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat6);
topodata = interpFunction(gridX,gridY);


subplot(246)
topoplot(dat6,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Old 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));

hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat7);
topodata = interpFunction(gridX,gridY);


subplot(247)
topoplot(dat7,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Old 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat8);
topodata = interpFunction(gridX,gridY);


subplot(248)
topoplot(dat8,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Old 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold off

% plotar a diferença, tanto topografico nas diversas epochs e por tempo. 
% pra ver se a diferença é divertida

figure;
subplot(141)
topoplot(dat5-dat1,'AllElectrodesposition.locs');
title('Difference between Old/New 200-300 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat5-dat1)));
hold on
subplot(142)
topoplot(dat6-dat2,'AllElectrodesposition.locs');
title('Difference between Old/New 300-500 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat6-dat2)));
hold on
subplot(143)
topoplot((dat7-dat3)*8,'AllElectrodesposition.locs');
title('Difference between Old/New 500-800 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat7-dat3)));
hold on
subplot(144)
topoplot(dat8-dat4,'AllElectrodesposition.locs');
title('Difference between Old/New 800-1100 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat8-dat4)));
hold off




%%emo/CR/neu
%as condições emo/new/neu

% data from this frequency from some other matrix
dat1 = mean_new200_300';
dat2 = mean_new300_500';
dat3 = mean_new500_800';
dat4 = mean_new800_1100';
dat5 = mean_neu200_300';
dat6 = mean_neu300_500';
dat7 = mean_neu500_800';
dat8 = mean_neu800_1100';
dat9 = mean_emo200_300';
dat10 = mean_emo300_500';
dat11 = mean_emo500_800';
dat12 = mean_emo800_1100';
% now interpolate the data on a 2D grid
interpFunction = TriScatteredInterp(elocsY,elocsX,dat1);
topodata = interpFunction(gridX,gridY);
figure, clf

subplot(341)
topoplot(dat1,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat2);
topodata = interpFunction(gridX,gridY);


subplot(342)
topoplot(dat2,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat3);
topodata = interpFunction(gridX,gridY);


subplot(343)
topoplot(dat3,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat4);
topodata = interpFunction(gridX,gridY);


subplot(344)
topoplot(dat4,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat4)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat5);
topodata = interpFunction(gridX,gridY);


subplot(345)
topoplot(dat5,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat6);
topodata = interpFunction(gridX,gridY);


subplot(346)
topoplot(dat6,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));

hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat7);
topodata = interpFunction(gridX,gridY);


subplot(347)
topoplot(dat7,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat8);
topodata = interpFunction(gridX,gridY);


subplot(348)
topoplot(dat8,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold off

interpFunction = TriScatteredInterp(elocsY,elocsX,dat9);
topodata = interpFunction(gridX,gridY);


subplot(349)
topoplot(dat9,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat10);
topodata = interpFunction(gridX,gridY);


subplot(3,4,10)
topoplot(dat10,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10)));

hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat11);
topodata = interpFunction(gridX,gridY);


subplot(3,4,11)
topoplot(dat11,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat12);
topodata = interpFunction(gridX,gridY);


subplot(3,4,12)
topoplot(dat12,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12)));
hold off




%%Próximo passo fazer um subplot com mapas topograficos das três epochs para
%as condições neg/neu/pos

% data from this frequency from some other matrix
dat1 = mean_neg200_300';
dat2 = mean_neg300_500';
dat3 = mean_neg500_800';
dat4 = mean_neg800_1100';
dat5 = mean_neu200_300';
dat6 = mean_neu300_500';
dat7 = mean_neu500_800';
dat8 = mean_neu800_1100';
dat9 = mean_pos200_300';
dat10 = mean_pos300_500';
dat11 = mean_pos500_800';
dat12 = mean_pos800_1100';
% now interpolate the data on a 2D grid
interpFunction = TriScatteredInterp(elocsY,elocsX,dat1);
topodata = interpFunction(gridX,gridY);
figure, clf

subplot(341)
topoplot(dat1,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat2);
topodata = interpFunction(gridX,gridY);


subplot(342)
topoplot(dat2,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat3);
topodata = interpFunction(gridX,gridY);


subplot(343)
topoplot(dat3,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat4);
topodata = interpFunction(gridX,gridY);


subplot(344)
topoplot(dat4,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat5);
topodata = interpFunction(gridX,gridY);


subplot(345)
topoplot(dat5,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat6);
topodata = interpFunction(gridX,gridY);


subplot(346)
topoplot(dat6,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat7);
topodata = interpFunction(gridX,gridY);


subplot(347)
topoplot(dat7,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold off

interpFunction = TriScatteredInterp(elocsY,elocsX,dat8);
topodata = interpFunction(gridX,gridY);

subplot(348)
topoplot(dat8,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat9);
topodata = interpFunction(gridX,gridY);

subplot(349)
topoplot(dat9,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat10);
topodata = interpFunction(gridX,gridY);


subplot(3,4,10)
topoplot(dat10,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat11);
topodata = interpFunction(gridX,gridY);


subplot(3,4,11)
topoplot(dat11,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11)));
hold on

interpFunction = TriScatteredInterp(elocsY,elocsX,dat12);
topodata = interpFunction(gridX,gridY);


subplot(3,4,12)
topoplot(dat12,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12)));
hold on




%%
%PLOTAR AS DIFERENÇAS NEU VS CR / emo vs cr/ emo vs neu/ neg vs neu/ neg vs cr
dat1 = mean_new200_300';
dat2 = mean_new300_500';
dat3 = mean_new500_800';
dat4 = mean_new800_1100';
dat5 = mean_neu200_300';
dat6 = mean_neu300_500';
dat7 = mean_neu500_800';
dat8 = mean_neu800_1100';
dat9 = mean_emo200_300';
dat10 = mean_emo300_500';
dat11 = mean_emo500_800';
dat12 = mean_emo800_1100';
figure;
subplot(341)
topoplot(dat5-dat1,'AllElectrodesposition.locs');
title('Difference between Neu/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(342)
topoplot(dat6-dat2,'AllElectrodesposition.locs');
title('Difference between Neu/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(343)
topoplot(dat7-dat3,'AllElectrodesposition.locs');
title('Difference between Neu/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(344)
topoplot(dat8-dat4,'AllElectrodesposition.locs');
title('Difference between Neu/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8-dat4)));
hold on

subplot(345)
topoplot(dat9-dat1,'AllElectrodesposition.locs');
title('Difference between Emo/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(346)
topoplot(dat10-dat2,'AllElectrodesposition.locs');
title('Difference between Emo/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(347)
topoplot(dat11-dat3,'AllElectrodesposition.locs');
title('Difference between Emo/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(348)
topoplot(dat12-dat4,'AllElectrodesposition.locs');
title('Difference between Emo/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(349)
topoplot(dat9-dat5,'AllElectrodesposition.locs');
title('Difference between Emo/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(3,4,10)
topoplot(dat10-dat6,'AllElectrodesposition.locs');
title('Difference between Emo/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(3,4,11)
topoplot(dat11-dat7,'AllElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(3,4,12)
topoplot(dat12-dat8,'AllElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off



dat1 = mean_new200_300';
dat2 = mean_new300_500';
dat3 = mean_new500_800';
dat4 = mean_new800_1100';
dat5 = mean_neu200_300';
dat6 = mean_neu300_500';
dat7 = mean_neu500_800';
dat8 = mean_neu800_1100';
dat9 = mean_neg200_300';
dat10 = mean_neg300_500';
dat11 = mean_neg500_800';
dat12 = mean_neg800_1100';
figure;

subplot(241)
topoplot(dat9-dat1,'AllElectrodesposition.locs');
title('Difference between Neg/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(242)
topoplot(dat10-dat2,'AllElectrodesposition.locs');
title('Difference between Neg/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(243)
topoplot(dat11-dat3,'AllElectrodesposition.locs');
title('Difference between Neg/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(244)
topoplot(dat12-dat4,'AllElectrodesposition.locs');
title('Difference between Neg/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(245)
topoplot(dat9-dat5,'AllElectrodesposition.locs');
title('Difference between Neg/Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(2,4,6)
topoplot(dat10-dat6,'AllElectrodesposition.locs');
title('Difference between Neg/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(2,4,7)
topoplot(dat11-dat7,'AllElectrodesposition.locs');
title('Difference between Neg/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(2,4,8)
topoplot(dat12-dat8,'AllElectrodesposition.locs');
title('Difference between Neg/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off
%%
% Same but with the selected cluster 
% data from this frequency from some other matrix
dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_old200_300';
dat6 = meanSelected_old300_500';
dat7 = meanSelected_old500_800';
dat8 = meanSelected_old800_1100';
% now interpolate the data on a 2D grid
figure;
subplot(241)
topoplot(dat1,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on




subplot(242)
topoplot(dat2,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on




subplot(243)
topoplot(dat3,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on




subplot(244)
topoplot(dat4,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat4)));
hold on



subplot(245)
topoplot(dat5,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on




subplot(246)
topoplot(dat6,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));

hold on


subplot(247)
topoplot(dat7,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold on


subplot(248)
topoplot(dat8,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold off

% plotar a diferença, tanto topografico nas diversas epochs e por tempo. 
% pra ver se a diferença é divertida

figure;
subplot(141)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Old/New 200-300 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat5-dat1)));
hold on
subplot(142)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Old/New 300-500 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat6-dat2)));
hold on
subplot(143)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Old/New 500-800 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat7-dat3)));
hold on
subplot(144)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Old/New 800-1100 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat8-dat4)));
hold off
%%emo/CR/neu
%as condições emo/new/neu

% data from this frequency from some other matrix
dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_emo200_300';
dat10 = meanSelected_emo300_500';
dat11 = meanSelected_emo500_800';
dat12 = meanSelected_emo800_1100';
% now interpolate the data on a 2D grid

subplot(341)
topoplot(dat1,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on

subplot(342)
topoplot(dat2,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on

subplot(343)
topoplot(dat3,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

subplot(344)
topoplot(dat4,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat4)));
hold on

subplot(345)
topoplot(dat5,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

subplot(346)
topoplot(dat6,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));

hold on

subplot(347)
topoplot(dat7,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold on

subplot(348)
topoplot(dat8,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold off

subplot(349)
topoplot(dat9,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

subplot(3,4,10)
topoplot(dat10,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10)));

hold on

subplot(3,4,11)
topoplot(dat11,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11)));
hold on

subplot(3,4,12)
topoplot(dat12,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12)));
hold off
% diferenças agora
figure;
subplot(341)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Neu/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(342)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Neu/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(343)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Neu/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(344)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Neu/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8-dat4)));
hold on

subplot(345)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Emo/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(346)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Emo/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(347)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Emo/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(348)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Emo/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(349)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(3,4,10)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(3,4,11)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(3,4,12)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off

%GRANDE 4X4 DIFERENÇAS 


dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_emo200_300';
dat10 = meanSelected_emo300_500';
dat11 = meanSelected_emo500_800';
dat12 = meanSelected_emo800_1100';
figure;
subplot(441)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Neu/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(442)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Neu/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(443)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Neu/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(444)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Neu/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8-dat4)));
hold on

subplot(445)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Emo/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(446)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Emo/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(447)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Emo/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(448)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Emo/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(449)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(4,4,10)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(4,4,11)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(4,4,12)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold on


dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_old200_300';
dat6 = meanSelected_old300_500';
dat7 = meanSelected_old500_800';
dat8 = meanSelected_old800_1100';


subplot(4,4,13)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Old/New 200-300 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat5-dat1)));
hold on
subplot(4,4,14)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Old/New 300-500 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat6-dat2)));
hold on
subplot(4,4,15)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Old/New 500-800 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat7-dat3)));
hold on
subplot(4,4,16)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Old/New 800-1100 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat8-dat4)));
hold off


%%Próximo passo fazer um subplot com mapas topograficos das três epochs para
%as condições neg/neu/pos

% data from this frequency from some other matrix
dat1 = meanSelected_neg200_300';
dat2 = meanSelected_neg300_500';
dat3 = meanSelected_neg500_800';
dat4 = meanSelected_neg800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_pos200_300';
dat10 = meanSelected_pos300_500';
dat11 = meanSelected_pos500_800';
dat12 = meanSelected_pos800_1100';

subplot(341)
topoplot(dat1,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on

subplot(342)
topoplot(dat2,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on

subplot(343)
topoplot(dat3,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

subplot(344)
topoplot(dat4,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

subplot(345)
topoplot(dat5,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

subplot(346)
topoplot(dat6,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));
hold on

subplot(347)
topoplot(dat7,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold off

subplot(348)
topoplot(dat8,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold on

subplot(349)
topoplot(dat9,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9)));
hold on

subplot(3,4,10)
topoplot(dat10,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10)));
hold on

subplot(3,4,11)
topoplot(dat11,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11)));
hold on

subplot(3,4,12)
topoplot(dat12,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12)));
hold on




%%
%PLOTAR AS DIFERENÇAS NEU VS CR / emo vs cr/ emo vs neu/ neg vs neu/ neg vs cr


% import selectedElectrodesposition.locs(se quiser fazer com os eletrodos selecionados algumas variaveis vao ter que ser modificadas) or AllElectrodesposition.locs (both in samplelocs eeglab folder) if it wasnt already imported in the
% begining. Rename second and third column as X and Y
% introduction to topographical plotting




dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_emo200_300';
dat10 = meanSelected_emo300_500';
dat11 = meanSelected_emo500_800';
dat12 = meanSelected_emo800_1100';
figure;
subplot(341)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Neu/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(342)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Neu/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(343)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Neu/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(344)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Neu/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8-dat4)));
hold on

subplot(345)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Emo/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(346)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Emo/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(347)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Emo/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(348)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Emo/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(349)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(3,4,10)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(3,4,11)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(3,4,12)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off



dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_neg200_300';
dat10 = meanSelected_neg300_500';
dat11 = meanSelected_neg500_800';
dat12 = meanSelected_neg800_1100';
figure;

subplot(241)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Neg/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(242)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Neg/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(243)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Neg/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(244)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Neg/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(245)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(2,4,6)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(2,4,7)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(2,4,8)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off






% plotar a diferença, tanto topografico nas diversas epochs e por tempo. 
% % pra ver se a diferença é divertida
% 
 figure;
 subplot(131)
 topoplot(dat4-dat1,'AllElectrodesposition.locs');
 title('Difference between Old/New 200-300 ms')
 cbar('horiz',0,[-1 1]*max(abs(dat4-dat1)));
 hold on
 subplot(132)
 topoplot(dat5-dat2,'AllElectrodesposition.locs');
 title('Difference between Old/New 300-500 ms')
 cbar('horiz',0,[-1 1]*max(abs(dat5-dat2)));
 hold on
 subplot(133)
 topoplot(dat6-dat3,'AllElectrodesposition.locs');
 title('Difference between Old/New 500-1100 ms')
 cbar('horiz',0,[-1 1]*max(abs(dat6-dat3)));
 hold off
