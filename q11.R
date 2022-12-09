
library(tidyverse)
library(scales)
eu = "Austria, Belgium, Bulgaria, Croatia, Cyprus, Czechia, Denmark,
Estonia, Finland, France, Germany, Greece, Hungary, Ireland, Italy, Latvia, 
Lithuania, Luxembourg, Malta, Netherlands, Poland, Portugal, Romania, Slovakia,
Slovenia, Spain, Sweden" %>%
  str_split(',') %>% unlist() %>% str_squish()
df = read_csv('Ukrainian_refugees.csv')
df$eu = ifelse(df$Country %in% eu,'Yes', "No")
df$color = ifelse(df$Country %in% eu,'#003399', "#999999")

df %>% 
  ggplot(aes(
    x = `Number of Ukrainian Refugees`,
    y = Country %>% reorder(df$`Number of Ukrainian Refugees`),
    fill = eu,
  )) + geom_col() +
  geom_text(aes(label = df$`Number of Ukrainian Refugees`),
            position=position_dodge(width=0.9), hjust=-0.08, size = 3)+
  scale_fill_manual(values = df$color) +
  scale_x_continuous(labels = label_comma())+
  theme(legend.position = c(0.9, 0.2)) +
  labs(title = 'Sum of Ukrainian Refugees, Feb-Nov 2022',
       y = 'Country Fled to',fill = 'EU')
  







