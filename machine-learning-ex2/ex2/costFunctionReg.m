function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
  m = length(y); % number of training examples

% You need to return the following variables correctly 
  J = 0;
  grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


  for i =[1:m]
    J += -y(i,:)*log(sigmoid(theta'*X(i,:)')) - (1-y(i,:))*log(1- sigmoid(theta'*X(i,:)'));
  end 
  % J = -y'*(log(sigmoid(theta'*X')))' - (1-y)'*(log(1- sigmoid(theta'*X')))';
  J=J/m;
  J = J + (lambda/(2*m)) *(sum(theta.^2)-sum(theta(1,:).^2));

  for i = [1:m]
    grad += (sigmoid(theta'*X(i,:)') - y(i,:))*X(i,:)';
  end
  % grad = ((sigmoid(theta'*X') - y')*X)';
  grad = grad/m;

  for j = [1:length(grad)]
    if j>1 
      grad(:,j) += lambda/m*theta(:,j);
    end
  end
% =============================================================

end
