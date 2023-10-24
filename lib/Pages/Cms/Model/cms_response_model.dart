class CmsResponseModel {
  CmsResponseModel({
    required this.cmsDataList,
  });

  final List<CmsData> cmsDataList;

  factory CmsResponseModel.fromJson(List<dynamic> json) {
    final List<CmsData> dataList =
        json.map((item) => CmsData.fromJson(item)).toList();
    return CmsResponseModel(cmsDataList: dataList);
  }
}

class CmsData {
  CmsData({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String content;
  final String createdAt;
  final String updatedAt;
  final int v;

  factory CmsData.fromJson(Map<String, dynamic> json) {
    return CmsData(
      id: json['_id'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      v: json['__v'] as int,
    );
  }
}
