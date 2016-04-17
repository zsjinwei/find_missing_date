% �ҳ���������������ȱʧ��Ԫ������ֵ
% ���ߣ��ƽ�ΰ
% 2016-04-17
% ʹ�÷�����
% ��������[20160102 20160103 20160105 20160106 20160108]
% ����õ�[3 5]����ʾ��������ĵ�3��5��λ��Ϊ���ڵĲ�����λ��
% ���������������(xxxx��ʾ��λ��ݣ����һ���ǲ�ֵ)��
% xxxx0101 xxxx0102  1
% xxxx0131 xxxx0201 70
% xxxx0228 xxxx0301 73
% xxxx0229 xxxx0301 72
% xxxx0430 xxxx0501 71
% �ܽ��������ǣ�
% �������һ�����һ���ֵ70
% С�����һ�����һ���ֵ71
% 2�����⴦������������һ�����һ���ֵ72
% ƽ��������һ�����һ���ֵ73
% 
% ���۾��ǣ���ֵֻҪ��1��70��8870����100%ûȱʧ�ģ�71��72��73�п���ȱʧ���������100%ȱʧ

function idx = find_missing_date(date_arr)
    date_arr_t = [date_arr(1)-1 date_arr(1:end-1)];
    date_diff = date_arr - date_arr_t;
    diff_all = find(date_diff ~= 1 & date_diff ~= 8870 & date_diff ~= 70 & date_diff ~= 71 & date_diff ~= 72 & date_diff ~= 73);
    diff71 = find(date_diff == 71);
    diff72 = find(date_diff == 72);
    diff73 = find(date_diff == 73);
    idx = diff_all;
    for i=1:1:length(diff71)
        mon = mod(floor(date_arr(diff71(i))/100.0),100);
        if ~ismember(mon, [1 3 5 7 8 10 12])
            idx = [idx diff71(i)];
        end
    end
    for i=1:1:length(diff72)
        year = floor(date_arr(diff72(i))/10000.0);
        mon = mod(floor(date_arr(diff72(i))/100.0),100);
        if mon~=3
            idx = [idx diff72(i)];
        else
            if ~(mod(year,4)==0 && mod(year,100)~=0 || mod(year,400)==0)
                idx = [idx diff72(i)];
            end
        end
    end
    for i=1:1:length(diff73)
        year = floor(date_arr(diff73(i))/10000.0);
        mon = mod(floor(date_arr(diff73(i))/100.0),100);
        if mon~=3
            idx = [idx diff73(i)];
        else
            if (mod(year,4)==0 && mod(year,100)~=0 || mod(year,400)==0)
                idx = [idx diff73(i)];
            end
        end
    end
end
