package com.test.parts.service;

import com.test.parts.model.Parts;

import java.util.List;

public interface PartsService {
    void save(Parts part);
    List<Parts> getAllFromParts();
    List<Parts> getAllFromPartsLimited(int pageNumber);
    List<Parts> getPartsByFilter(String filter);
    List<Parts> getSearchingParts(String text);
    int countAllParts();
    Parts getPartById(Integer partId);
    void updatePart(Parts part);
    void deletePart(Integer partId);
    int countPossibleComputers(List<Parts> parts);

}
