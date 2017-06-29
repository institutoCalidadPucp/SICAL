SampleCategory.create(laboratory_id: 1,name: "Categoria 1",description: "Desc1",status: 0)
SampleCategory.create(laboratory_id: 1,name: "Categoria 2",description: "Desc2",status: 0)

SampleCategoryxSampleMethod.create(sample_category_id: 1,sample_method_id: 1)
SampleCategoryxSampleMethod.create(sample_category_id: 2,sample_method_id: 1)
SampleCategoryxSampleMethod.create(sample_category_id: 2,sample_method_id: 2)

ChainFeature.create(sample_categoryx_sample_method_id: 1,concept: "PH",lower_range: 1.0,upper_range: 1.5)
ChainFeature.create(sample_categoryx_sample_method_id: 1,concept: "PH2",lower_range: 4.0,upper_range: 7.5)

ChainFeature.create(sample_categoryx_sample_method_id: 2,concept: "LH3",lower_range: 5.0,upper_range: 8.5)
ChainFeature.create(sample_categoryx_sample_method_id: 3,concept: "LH4",lower_range: 15.0,upper_range: 18.5)