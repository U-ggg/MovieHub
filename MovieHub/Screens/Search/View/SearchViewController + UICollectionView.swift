//
//  SearchViewController + UICollectionView.swift
//  MovieHub
//
//  Created by Келлер Дмитрий on 28.12.2023.
//
import UIKit

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section >= 0 && section <= sections.count {
//            let currentSection = sections[section]
//            switch currentSection {
//                
//            case .upcomingMovies:
//                return presenter?.getUpcomingMovie().count ?? 0
//            case .recentMovies:
//                return presenter?.getUpcomingMovie().count ?? 0
//            }
//        }
//        return 0
        switch section {
        case 0:
            return presenter?.getUpcomingMovie().count ?? 0
        case 1:
            return 0
          //  return presenter?.getUpcomingMovie().count ?? 0
        default:
            return 0
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .upcomingMovies:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingMovieCell.identifier, for: indexPath) as? UpcomingMovieCell else { return UICollectionViewCell() }
             
            guard let model = self.presenter?.getUpcomingMovie() else { return UICollectionViewCell() }
            
            cell.configure(with: model[indexPath.row])
            return cell
            
        case .recentMovies:
            return UICollectionViewCell()
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.identifier, for: indexPath) as? PopularCell else { return UICollectionViewCell() }
//            
//            guard let model = self.presenter?.getSearchData() else { return UICollectionViewCell() }
//            cell.configure(category: model[indexPath.row])
//            
//            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SearchHeader.identifier,
                for: indexPath
            ) as? SearchHeader else { return UICollectionReusableView() }
            header.configure(header: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: -  UICollectionViewDelegate,
extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       //
    }
}
