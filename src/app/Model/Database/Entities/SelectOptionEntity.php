<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 15:56
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TTitleProperty;

/**
 * Class SelectOptionEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\Fields
 * @ORM\Entity()
 */
class SelectOptionEntity
{
    use TIdentificationProperties, TTitleProperty {
        TTitleProperty::__construct as private initializeTitle;
    }

    /**
     * @var SelectFieldEntity
     * @ORM\ManyToOne(targetEntity="SelectFieldEntity")
     */
    private $selectField;

    public function __construct(SelectFieldEntity $selectField)
    {
        $this->initializeTitle();
        $this->selectField = $selectField;
    }

    /**
     * @return SelectFieldEntity
     */
    public function getSelectField(): SelectFieldEntity
    {
        return $this->selectField;
    }


}
