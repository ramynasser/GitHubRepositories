//
//  GithubRepoResponseApi.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//


import Foundation

struct GithubRepo : Codable {

    let archiveUrl : String?
    let assigneesUrl : String?
    let blobsUrl : String?
    let branchesUrl : String?
    let collaboratorsUrl : String?
    let commentsUrl : String?
    let commitsUrl : String?
    let compareUrl : String?
    let contentsUrl : String?
    let contributorsUrl : String?
    let deploymentsUrl : String?
    let descriptionField : String?
    let downloadsUrl : String?
    let eventsUrl : String?
    let fork : Bool?
    let forksUrl : String?
    let fullName : String?
    let gitCommitsUrl : String?
    let gitRefsUrl : String?
    let gitTagsUrl : String?
    let hooksUrl : String?
    let htmlUrl : String?
    let id : Int?
    let issueCommentUrl : String?
    let issueEventsUrl : String?
    let issuesUrl : String?
    let keysUrl : String?
    let labelsUrl : String?
    let languagesUrl : String?
    let mergesUrl : String?
    let milestonesUrl : String?
    let name : String?
    let nodeId : String?
    let notificationsUrl : String?
    let owner : Owner?
    let privateField : Bool?
    let pullsUrl : String?
    let releasesUrl : String?
    let stargazersUrl : String?
    let statusesUrl : String?
    let subscribersUrl : String?
    let subscriptionUrl : String?
    let tagsUrl : String?
    let teamsUrl : String?
    let treesUrl : String?
    let url : String?


    enum CodingKeys: String, CodingKey {
        case archiveUrl = "archive_url"
        case assigneesUrl = "assignees_url"
        case blobsUrl = "blobs_url"
        case branchesUrl = "branches_url"
        case collaboratorsUrl = "collaborators_url"
        case commentsUrl = "comments_url"
        case commitsUrl = "commits_url"
        case compareUrl = "compare_url"
        case contentsUrl = "contents_url"
        case contributorsUrl = "contributors_url"
        case deploymentsUrl = "deployments_url"
        case descriptionField = "description"
        case downloadsUrl = "downloads_url"
        case eventsUrl = "events_url"
        case fork = "fork"
        case forksUrl = "forks_url"
        case fullName = "full_name"
        case gitCommitsUrl = "git_commits_url"
        case gitRefsUrl = "git_refs_url"
        case gitTagsUrl = "git_tags_url"
        case hooksUrl = "hooks_url"
        case htmlUrl = "html_url"
        case id = "id"
        case issueCommentUrl = "issue_comment_url"
        case issueEventsUrl = "issue_events_url"
        case issuesUrl = "issues_url"
        case keysUrl = "keys_url"
        case labelsUrl = "labels_url"
        case languagesUrl = "languages_url"
        case mergesUrl = "merges_url"
        case milestonesUrl = "milestones_url"
        case name = "name"
        case nodeId = "node_id"
        case notificationsUrl = "notifications_url"
        case owner
        case privateField = "private"
        case pullsUrl = "pulls_url"
        case releasesUrl = "releases_url"
        case stargazersUrl = "stargazers_url"
        case statusesUrl = "statuses_url"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case tagsUrl = "tags_url"
        case teamsUrl = "teams_url"
        case treesUrl = "trees_url"
        case url = "url"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        archiveUrl = try values.decodeIfPresent(String.self, forKey: .archiveUrl)
        assigneesUrl = try values.decodeIfPresent(String.self, forKey: .assigneesUrl)
        blobsUrl = try values.decodeIfPresent(String.self, forKey: .blobsUrl)
        branchesUrl = try values.decodeIfPresent(String.self, forKey: .branchesUrl)
        collaboratorsUrl = try values.decodeIfPresent(String.self, forKey: .collaboratorsUrl)
        commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
        commitsUrl = try values.decodeIfPresent(String.self, forKey: .commitsUrl)
        compareUrl = try values.decodeIfPresent(String.self, forKey: .compareUrl)
        contentsUrl = try values.decodeIfPresent(String.self, forKey: .contentsUrl)
        contributorsUrl = try values.decodeIfPresent(String.self, forKey: .contributorsUrl)
        deploymentsUrl = try values.decodeIfPresent(String.self, forKey: .deploymentsUrl)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        downloadsUrl = try values.decodeIfPresent(String.self, forKey: .downloadsUrl)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
        forksUrl = try values.decodeIfPresent(String.self, forKey: .forksUrl)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        gitCommitsUrl = try values.decodeIfPresent(String.self, forKey: .gitCommitsUrl)
        gitRefsUrl = try values.decodeIfPresent(String.self, forKey: .gitRefsUrl)
        gitTagsUrl = try values.decodeIfPresent(String.self, forKey: .gitTagsUrl)
        hooksUrl = try values.decodeIfPresent(String.self, forKey: .hooksUrl)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        issueCommentUrl = try values.decodeIfPresent(String.self, forKey: .issueCommentUrl)
        issueEventsUrl = try values.decodeIfPresent(String.self, forKey: .issueEventsUrl)
        issuesUrl = try values.decodeIfPresent(String.self, forKey: .issuesUrl)
        keysUrl = try values.decodeIfPresent(String.self, forKey: .keysUrl)
        labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
        languagesUrl = try values.decodeIfPresent(String.self, forKey: .languagesUrl)
        mergesUrl = try values.decodeIfPresent(String.self, forKey: .mergesUrl)
        milestonesUrl = try values.decodeIfPresent(String.self, forKey: .milestonesUrl)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        notificationsUrl = try values.decodeIfPresent(String.self, forKey: .notificationsUrl)
        owner = try Owner(from: decoder)
        privateField = try values.decodeIfPresent(Bool.self, forKey: .privateField)
        pullsUrl = try values.decodeIfPresent(String.self, forKey: .pullsUrl)
        releasesUrl = try values.decodeIfPresent(String.self, forKey: .releasesUrl)
        stargazersUrl = try values.decodeIfPresent(String.self, forKey: .stargazersUrl)
        statusesUrl = try values.decodeIfPresent(String.self, forKey: .statusesUrl)
        subscribersUrl = try values.decodeIfPresent(String.self, forKey: .subscribersUrl)
        subscriptionUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionUrl)
        tagsUrl = try values.decodeIfPresent(String.self, forKey: .tagsUrl)
        teamsUrl = try values.decodeIfPresent(String.self, forKey: .teamsUrl)
        treesUrl = try values.decodeIfPresent(String.self, forKey: .treesUrl)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }


}
