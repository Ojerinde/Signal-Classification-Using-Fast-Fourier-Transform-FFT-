function model = train_model(X, y, method)
    if nargin < 3
        method = 'svm';
    end

    switch lower(method)
        case 'svm'
            model = fitcecoc(X, y);  % Multi-class SVM
        case 'tree'
            model = fitctree(X, y);  % Decision Tree
        otherwise
            error('Unsupported classifier');
    end
end
