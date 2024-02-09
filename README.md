# ONET_Prediction
Predict ONET id, given a job posting

## Approach:
Use a pretrained model to use the concatenated TITLE_RAW & BODY of the job posting to predict the ONET id associated with that posting. 
HuggingFace library SentenceTransformer('all-MiniLM-L6-v2') was used to determine the simialrity between each supplied text body with 699 available labels, which are the ONET_NAME fields. The resulting scores from the 699 comparisons are sorted in ascending order to select the top 10 predictions.Eventually, the ONET_ID is matched with the ONET_NAME and the list of top 10 ONET ids are output. 
Preprocessing takes the form of concatenating the two fields: TITLE_RAW & BODY. Then, truncating it to 250 words. Ideally, I would prefer to Summarize the text whisch would go for embedding. However, due to extreme slow processing speed on Colab, I chose to truncate instead, which is perhaps not a good option. 
Finally, the predict() method can intake a job posting or a raw title, or a combination of both and produce a list of top 10 ONET id that might fit the job description. 
Alternatively, a dataframe in pandas can be fed in as df_test in the colab file, using a csv file as input to get a new column named ONET_lst_10 that provides a list of top 10 ONET ids in ranked order.

## Assumptions:
The assumption for truncating the text input to 250 characters is that we need not provide the entire text, which can run upto a maximum of 4570 words. The similarity model would not be able to support texts of that length. Also, the mode of the distribution for length of words per input text is around 359 words. In lieu of summarization due to processing speed, I chose to truncate the concatenated input text. 
It has been assumed that the concatenated input text will be similar to the ONET_NAME. Visually comparing some of the pairs show closeness of the two. 
It is also assumed that the pretrained model is suited for the job without retraining the top layer, which is perhaps not true and need to be tested, given sufficient time and procesing power. 

## Metrics:
Accuracy has been defined as the total number of hits divided by total number of cases provided, although this is not a very good measure. Mean Reciprocal Rank (MRR) has also been calculated, which is slightly better way of measuring the performance of the model. I would also like to add f1 score moving forward.

## Conclusions:
The model is only about 58% accurate, with MRR scores as low as 36%. Hence, more work is needed to improve the model. The model is a good starting point to start experimenting with more ideas to improve it.

## Future Work:
1. Re-training the top layer, using different optimizers and also trying out different SentenceTransformer models to improve the performance
2. Using summarize function to reduce the amount of input text as opposed to truncating it.
3. Trying out two more models independently - with TITLE_RAW & BODY, and compare the performance with the concatenated text input model.
4. To expand this analysis, we need to also be aware of using more efficient preprocessing options that can handle larger volumes of data. This model has limitations on the size of inputs. 

* [Full Noebook:] https://github.com/agniji/ONET_Prediction/blob/main/ONET_Pred.ipynb
