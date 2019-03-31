<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 27.3.19
 * Time: 17:18
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TDescriptionProperty;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TInternalNameProperty;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TTitleProperty;

/**
 * Class FieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 * @ORM\InheritanceType(value="SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="type", type="string"))
 */
abstract class FieldEntity
{
    use TIdentificationProperties, TInternalNameProperty, TTitleProperty, TDescriptionProperty {
        TInternalNameProperty::__construct as private initializeInternalName;
        TTitleProperty::__construct as private initializeTitle;
        TDescriptionProperty::__construct as private initializeDescription;
    }

    /**
     * @var MultilanguageString
     * @ORM\OneToOne(targetEntity="MultilanguageString", cascade={"all"}, orphanRemoval=true)
     */
    private $units;

    /**
     * @var \Stopka\MediaFactory\Model\Database\Entities\FieldValueEntity
     * @ORM\OneToOne(targetEntity="FieldValueEntity", cascade={"all"}, orphanRemoval=true)
     */
    private $defaultValue;

    protected function __construct(string $internalName, FieldValueEntity $defaultValue)
    {
        $this->initializeInternalName($internalName);
        $this->initializeTitle();
        $this->initializeDescription();
        $this->units = new MultilanguageString();
        $this->defaultValue = $defaultValue;
    }

    /**
     * @return \Stopka\MediaFactory\Model\Database\Entities\FieldValueEntity
     */
    public function getDefaultValue(): FieldValueEntity
    {
        return $this->defaultValue;
    }

    /**
     * @return MultilanguageString
     */
    public function getUnits(): MultilanguageString
    {
        return $this->units;
    }

}
