//
//  DownloadingImagesRow.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/04.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DownloadingImagesRow_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesRow(model: PhotoModel(albumID: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"))
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .previewLayout(.sizeThatFits)
    }
}
