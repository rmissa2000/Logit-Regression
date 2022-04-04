UniversalBank <- UniversalBank[ , -c(1, 5)]
UniversalBank$Education <- factor(UniversalBank$Education, levels = c(1,2,3),
                                  labels = c("undergrad", "graduate", 
                                             "advanced/professional"))
set.seed(2)
train.index <- sample(c(1:dim(UniversalBank)[1]), dim(UniversalBank)[1]*.6)
train.df<- UniversalBank[train.index, ]                        
valid.df <- UniversalBank[-train.index, ]



logit.reg <- glm(`Personal Loan` ~ ., data = train.df, family = "binomial")
options(scipen = 999)
summary(logit.reg)
