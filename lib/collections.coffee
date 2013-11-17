@Content = new Meteor.Collection "content"
###2 "content",
  smart: true
  schema:
    "owner":
      type: String
      min: 3
      max: 20
    "ownerSlug":
      type: String
      min: 3
      max: 20
    "title":
      type: String
      min: 3
      max: 20
    "titleSlug":
      type: String
      min: 3
      max: 20
    "type":
      type: String
      allowedValues: ["game","movie","short","song"]
    "contentBg":
      type: String
      min: 3
      optional: true
    "contentPreview":
      type: String
      min: 3
      optional: true
    "contentSrc":
      type: String
      min: 3
      optional: true
    "featured":
      type: Boolean
      optional: true
    "collaborators":
      type: [String]
      optional: true
      min: 3
    "about":
      type: [String]
      optional: true
      min: 3
    "community":
      type: [String]
      optional: true
      min: 3
    "rewards":
      type: [String]
      optional: true
      min: 3
    "commissions":
      type: [String]
      optional: true
      min: 3
    "updates":
      type: [String]
      optional: true
      min: 3###

@About = new Meteor.Collection2 "about",
  smart: true
  schema:
    #"about":
    #  type: [Object]
    #  optional: true
    #"about.$._id":
    #  type: String
    #  min: 3
    #  optional: true
    "parent":
      type: String
      min: 3
      max: 20
    "parentSlug":
      type: String
      min: 3
    "owner":
      type: String
      min: 3
      max: 20
    #"title":
    #  type: String
    #  min: 3
    #  max: 200
    #"titleSlug":
    #  type: String
    #  min: 3
    #"about.$.type":
    #  type: String
    #  allowedValues: ["text","gallery","music","video"]
    #  optional: true
    "content":
      type: String
      min: 3

@Community = new Meteor.Collection "community"
###,
  smart: true
  schema:
    #"community":
    #  type: [Object]
    #"_id":
    #  type: String
    #  min: 3
    "parent":
      type: String
      min: 3
      max: 20
    "parentSlug":
      type: String
      min: 3
    "owner":
      type: String
      min: 3
      max: 20
    "title":
      type: String
      min: 3
      max: 200
    "titleSlug":
      type: String
      min: 3
    "content":
      type: String
      min: 3
    "posts":
      type: [String]
    "pledgeTotal":
      type: Number
      optional: true###

@Posts = new Meteor.Collection2 "posts",
  smart: true
  schema:
    "parent":
      type: String
      min: 3
      max: 20
    "parentSlug":
      type: String
      min: 3
    "owner":
      type: String
      min: 3
      max: 20
    "content":
      type: String
      min: 1

@Pledges = new Meteor.Collection2 "pledges",
  smart: true
  schema:
    "userId":
      type: "String"
      min: 3
    "gameId":
      type: "String"
      min: 3
    "communityId":
      type: "String"
      min: 3
    "amount":
      type: Number
      min: 3