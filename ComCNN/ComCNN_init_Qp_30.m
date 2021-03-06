function net = CRCNN_init_model_64_25_Res_Bnorm_Adam

%%% 17 layers

lr  = [1 1];
lr1 = [1 0];
weightDecay = [1 0];
meanvar  =  [zeros(64,1,'single'), 0.01*ones(64,1,'single')];

% Define network
net.layers = {} ;

net.layers{end+1} = struct('type', 'conv', ...
    'weights', {{sqrt(2/(9*64))*randn(3,3,1,64,'single'), zeros(64,1,'single')}}, ...
    'stride', 1, ...
    'pad', 1, ...
    'learningRate',lr, ...
    'weightDecay',weightDecay, ...
    'opts',{{}}) ;

net.layers{end+1} = struct('type', 'relu','leak',0) ;

net.layers{end+1} = struct('type', 'conv', ...
        'weights', {{sqrt(2/(9*64))*randn(3,3,64,64,'single'), zeros(64,1,'single')}}, ...
        'stride', 2, ...
        'learningRate',lr1, ...
        'weightDecay',weightDecay, ...
        'pad', 1, 'opts', {{}}) ;

    net.layers{end+1} = struct('type', 'relu','leak',0) ;

net.layers{end+1} = struct('type', 'conv', ...
    'weights', {{sqrt(2/(9*64))*randn(3,3,64,1,'single'), zeros(1,1,'single')}}, ...
    'stride', 1, ...
    'learningRate',lr, ...
    'weightDecay',weightDecay, ...
    'pad', 1, 'opts', {{}}) ;

net.layers{end+1} = struct('type', 'loss') ; % make sure the new 'vl_nnloss.m' is in the same folder.

% Fill in default values
net = vl_simplenn_tidy(net);
