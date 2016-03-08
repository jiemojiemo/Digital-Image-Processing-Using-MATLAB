function g = instrans(f, method, varargin)

error(nargchk(2, 4, nargin));

if strcmp(method, 'log')
   g = logTransform(f, varargin{:}); 
   return;
end

if isfloat(f) && (max(f(:)) > 1 || min(f(:)) < 0)
    f = mat2gray(f);
end

[f,revertclass] = tofloat(f);

switch method
    case 'neg'
        g = imcomplement(f);
        
    case 'gamma'
        g = gammaTransform(f, varargin{:});
        
    case 'stretch'
        g = stretchTransform(f, varargin{:});
        
    case 'specified'
        g = specifiedTransform(f, varargin{:});
        
    otherwise
        error('Unknown enhancement method.');
end
g = revertclass(g);
%--------------------------------------------------------------%
    function g = gammaTransform(f, gamma)
       g = imadjust(f, [], [], gamma); 
    end
%--------------------------------------------------------------%
    function g = stretchTransform(f, varargin)
        if isempty(varargin)
            %Use defaults
            m = mean2(f); %求矩阵的均值
            E = 4.0;
        elseif length(varargin) == 2
            m = varargin{1};
            E = varargin{2};
        else
            error('Incorrect number of inputs ofr the stretch methon.');    
        end
        g = 1./(1 + (m./f).^E);
    end
%--------------------------------------------------------------%
    function g = specifiedTransform(f, txfun)
        txfun = txfun(:);
        if any(txfun) > 1 || any(txfun) <= 0
            error('All elements of txfun must be in the range[0,1]');
        end
        
        T = txfun;
        X = linspace(0, 1, numel(T));
        g = interp1(X, T, f);
    end
%--------------------------------------------------------------%
    function g = logTransform(f, varargin)
        [f,revertclass] = tofloat(f);
        if numel(varargin) >= 2
            if strcmp(varargin{2}, 'uint8')
                revertclass = @im2unit8;
            elseif strcmp(varargin{2}, 'uint16')
                revertclass = @im2uint16;
            else
                error('Unsupported CLASS opetion for ''log'' method');
            end
        end
        if numel(varargin) < 1
            % Set default for C
            C = 1;
        else
            C = varargin{1};
        end
        g = C * (log(1+f));
        g = revertclass(g);
    end
end